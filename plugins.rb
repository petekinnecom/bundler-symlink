require "bundler"
require "bundler/symlink"

Bundler::Plugin.add_hook('after-install-all') do |_dependencies|
  Bundler::Symlink.call
end
