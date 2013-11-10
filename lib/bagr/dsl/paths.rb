
require 'pathname'

module Bagr
  module DSL
    module Paths

      def build_to
        fetch(:build_to)
      end

      def build_path
        Pathname.new(build_to)
      end

      def src_path
        fetch(:src_dir)
      end

      def current_path
        fetch(:prj_dir)
      end

      def build_config_path
        Pathname.new fetch(:build_config_path, 'config/build.rb')
      end

      def repo_url
        require 'cgi'
        require 'uri'
        if fetch(:git_http_username) and fetch(:git_http_password)
          URI.parse(fetch(:repo_url)).tap do |repo_uri|
            repo_uri.user     = fetch(:git_http_username)
            repo_uri.password = CGI.escape(fetch(:git_http_password))
          end.to_s
        elsif fetch(:git_http_username)
          URI.parse(fetch(:repo_url)).tap do |repo_uri|
            repo_uri.user = fetch(:git_http_username)
          end.to_s
        else
          fetch(:repo_url)
        end
      end

      def repo_path
        build_path.join('repo')
      end

      def revision_log
        build_path.join('revisions.log')
      end

      def now
        env.timestamp.strftime("%Y%m%d%H%M%S")
      end

      def asset_timestamp
        env.timestamp.strftime("%Y%m%d%H%M.%S")
      end

      def linked_dirs(parent)
        paths = fetch(:linked_dirs)
        join_paths(parent, paths)
      end

      def linked_files(parent)
        paths = fetch(:linked_files)
        join_paths(parent, paths)
      end

      def linked_file_dirs(parent)
        map_dirnames(linked_files(parent))
      end

      def linked_dir_parents(parent)
        map_dirnames(linked_dirs(parent))
      end

      def join_paths(parent, paths)
        paths.map { |path| parent.join(path) }
      end

      def map_dirnames(paths)
        paths.map { |path| path.dirname }
      end
    end
  end
end
