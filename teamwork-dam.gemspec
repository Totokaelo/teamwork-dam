# frozen_string_literal: true

require 'English'
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'teamwork/dam/version'

Gem::Specification.new do |s|
  s.name        = 'teamwork-dam'
  s.version     = Teamwork::Dam::VERSION
  s.date        = Time.new.strftime('%Y-%m-%d')
  s.summary     = 'Teamwork DAM API wrapper'
  s.description = 'Toolkit for interacting with ' \
                  "Teamwork Retail's Digital Asset Manager"
  s.authors     = ['Quinton Harris']
  s.email       = 'quinton@totokaelo.com'
  s.files       = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.homepage    = 'https://github.com/Totokaelo/teamwork-dam'
  s.license     = 'MIT'

  # Deploy dependencies
  s.add_runtime_dependency 'curb'
end
