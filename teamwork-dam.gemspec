lib = File.expand_path("../lib/", __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require "teamwork/dam/version"

Gem::Specification.new do |s|
  s.name        = 'teamwork-dam'
  s.version     = Teamwork::Dam::VERSION
  s.date        = Time.new.strftime("%Y-%m-%d")
  s.summary     = "Teamwork DAM API wrapper"
  s.description = "Toolkit for interacting with Teamwork Retail's Digital Asset Manager"
  s.authors     = ["Quinton Harris"]
  s.email       = 'quinton@totokaelo.com'
  s.files       = `git ls-files`.split($/)
  s.homepage    = 'https://github.com/Totokaelo/teamwork-dam'
  s.license     = 'MIT'

  # Deploy dependencies
  s.add_runtime_dependency 'curb'
end
