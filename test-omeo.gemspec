# frozen_string_literal: true

require_relative "lib/test_omeo/version"

Gem::Specification.new do |spec|
  spec.name = "test_omeo"
  spec.version = TestOmeo::VERSION
  spec.authors = ["Ricardo Valeriano"]
  spec.email = ["mister.sourcerer@gmail.com"]

  spec.summary = "TestOmeo is a toy test framework in the tradition of xUnit."
  spec.description = "TestOmeo: a test framework to learn how to write one."
  spec.homepage = "https://github.com/SourcererOmeo/test_omeo"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
end
