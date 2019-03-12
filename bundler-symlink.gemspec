
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bundler/symlink/version"

Gem::Specification.new do |spec|
  spec.name = "bundler-symlink"
  spec.version = Bundler::Symlink::VERSION
  spec.authors = ["Pete Kinnecom"]
  spec.email = ["git@k7u7.com"]
  spec.licenses = ["WTFPL"]

  spec.summary = "Post-install hook for bundler to symlink to all gems from a local directory"
  spec.homepage = "https://github.com/petekinnecom/bundler-symlink"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.files = [
    "bundler-symlink.gemspec",
    "plugins.rb",
    "lib/bundler/symlink.rb",
    "lib/bundler/symlink/version.rb"
  ]
  spec.bindir = "exe"
  spec.executables = []
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", ">= 1.17.0"
end
