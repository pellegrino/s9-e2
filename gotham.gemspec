# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gotham/version"

Gem::Specification.new do |s|
  s.name        = "gotham"
  s.version     = Gotham::VERSION
  s.authors     = ["Scott M Parrish"]
  s.email       = ["anithri@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Gotham is a Console based board game.}
  s.description = %q{Cooperative game.}

  s.rubyforge_project = "gotham"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "colorize"
  s.add_runtime_dependency "highline"
end
