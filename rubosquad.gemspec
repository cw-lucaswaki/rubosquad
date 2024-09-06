Gem::Specification.new do |s|
  s.name        = 'rubosquad'
  s.version     = '0.1.0'
  s.summary     = 'Run RuboCop on changed files'
  s.description = 'A tool to run RuboCop on changed Ruby files in a Git repository'
  s.authors     = ['LucasWaki']
  s.email       = 'lucas.waki@cloudwalk.io'
  s.files       = ['lib/rubosquad.rb', 'bin/rubosquad']
  s.executables << 'rubosquad'
  s.homepage    = 'https://github.com/cw-lucaswaki/rubosquad'
  s.license     = 'MIT'
  s.add_runtime_dependency 'rubocop', '~> 1.0'
end