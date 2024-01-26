require "bundler/symlink/version"

require "tmpdir"
require "fileutils"

module Bundler
  module Symlink
    def self.call
      root_path = File.dirname(Bundler.default_gemfile)
      target_dir = File.join(
        root_path,
        '.bundle',
        'gems'
      )

      Dir.mktmpdir do |tmpdir|
        link_dir = File.join(tmpdir, 'gems')
        FileUtils.mkdir(link_dir)

        Bundler
          .load
          .specs
          .map(&:full_gem_path)
          .reject {|path| path.start_with?(root_path)}
          .each do |gem_path|
            target = File.join(
              link_dir,
              File.basename(gem_path)
            )

            FileUtils.ln_s(
              gem_path,
              target
            )
          end

        FileUtils.mkdir_p(File.dirname(target_dir))
        Bundler.ui.info("Symlinking bundled gems into #{target_dir}")
        FileUtils.rm_r(target_dir) if File.exist?(target_dir)
        FileUtils.cp_r(link_dir, target_dir)
      end
    end

    class Command
      Plugin::API.command('symlink', self)

      def exec(name, args)
        Symlink.call
      end
    end
  end
end
