lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-ciscospark/version"

Gem::Specification.new do |gem|
  gem.add_dependency "oauth2",     "~> 1.0"
  gem.add_dependency "omniauth",   "~> 1.2"

  gem.add_development_dependency "bundler", "~> 1.0"

  gem.authors       = ["Michael Bleigh", "Erik Michaels-Ober"]
  gem.email         = ["michael@intridea.com", "sferik@gmail.com"]
  gem.description   = "An abstract OAuth2 strategy for OmniAuth."
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/cloverhound/omniauth-ciscospark"
  gem.licenses      = %w(MIT)

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-ciscospark"
  gem.require_paths = %w(lib)
  gem.version       = OmniAuth::OAuth2::VERSION
end
