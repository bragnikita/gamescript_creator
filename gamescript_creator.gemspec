
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gamescript_creator/version"

Gem::Specification.new do |spec|
  spec.name          = "gamescript_creator"
  spec.version       = GamescriptCreator::VERSION
  spec.authors       = ["Nikita"]
  spec.email         = ["rinnoske@yandex.ru"]

  spec.summary       = %q{This ruby gem is a package of parsers and generators, that I'm using for game dialog scripts processing and publishing}
  spec.description   = %q{This ruby gem is a package of parsers and generators, that I'm using for game dialog scripts processing and publishing}
  spec.homepage      = "https://github.com/bragnikita/gamescript_creator"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/bragnikita/gamescript_creator"
    spec.metadata["changelog_uri"] = "https://github.com/bragnikita/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-html-matchers", "~> 0.9.0"
  spec.add_development_dependency "rspec-collection_matchers", "~> 1.1.0"
  spec.add_development_dependency "activesupport", ">= 3.0"

  spec.add_runtime_dependency "htmlbeautifier", "~> 1.3.0"
end
