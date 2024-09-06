#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open3'

# Get the list of changed Ruby files, excluding this script
script_name = File.basename(__FILE__)
changed_files = `git diff --name-only main | grep '\.rb$'`.split("\n").reject { |file| file == script_name }

if changed_files.empty?
  puts 'No Ruby files have changed.'
  exit 0
end

puts 'Running Rubocop on changed files:'
changed_files.each { |file| puts "- #{file}" }

# Check for available RuboCop extensions
extensions = %w[rubocop-factory_bot rubocop-rails rubocop-rspec rubocop-rspec_rails]
available_extensions = extensions.select { |ext| system("gem list -i #{ext} > /dev/null 2>&1") }

# Construct the RuboCop command
command = "rubocop -A --format offenses --format simple #{available_extensions.map do |ext|
  "--require #{ext}"
end.join(' ')} #{changed_files.join(' ')}"
stdout, stderr, status = Open3.capture3(command)

puts "\nRubocop Output:"

# Process and colorize output
processed_output = ''
seen_files = Set.new
current_file = nil

stdout.each_line do |line|
  if line.start_with?('==')
    file_path = line.strip.gsub(/^==\s*|\s*==$/, '')
    current_file = file_path
    processed_output += if seen_files.add?(file_path)
                          "\n\e[36m#{line}\e[0m"
                        else
                          "\n#{line}"
                        end
  elsif line.match?(/^[A-Z]:/)
    parts = line.split(':')
    offense_type = parts.shift
    line_col = parts.shift(2).map(&:strip).join(':')
    message = parts.join(':').strip
    processed_output += "[#{current_file}:#{line_col}] - #{offense_type}: #{message}\n"
  else
    processed_output += line
  end
end

puts processed_output

if status.success?
  puts "\nRubocop auto-corrections complete."
else
  puts "\nRubocop completed with offenses:"

  offenses = stdout.scan(/(\d+) offense.* detected/)
  total_offenses = offenses.flatten.map(&:to_i).sum

  puts "Files inspected: #{stdout[/(\d+) files? inspected/, 1] || 'Unknown'}"
  puts "Total offenses detected: #{total_offenses}"

  unless stderr.strip.empty?
    puts "\nStandard error:"
    puts stderr
  end
end

puts "\nRuboCop extensions used: #{available_extensions.join(', ')}"
