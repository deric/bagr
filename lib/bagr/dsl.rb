require 'bagr/dsl/env'
require 'bagr/dsl/paths'
require 'bagr/dsl/task_enhancements'

module Bagr
  module DSL

    include Env
    include Paths
    include TaskEnhancements

    def invoke(task, *args)
      Rake::Task[task].invoke(*args)
    end

    def t(key, options={})
      I18n.t(key, options.merge(scope: :bagr))
    end

    def scm
      fetch(:scm)
    end

    def sudo(*args)
      execute :sudo, *args
    end

    def capturing_revisions(&block)
      set :previous_revision, fetch_revision
      block.call
      set :current_revision, fetch_revision
    end

    def revision_log_message
      fetch(:revision_log_message,
        t(:revision_log_message,
          branch: fetch(:branch),
          user: local_user,
          sha: fetch(:current_revision),
          release: release_timestamp)
       )
    end

    def local_user
      `whoami`
    end

    def lock(locked_version)
      VersionValidator.new(locked_version).verify
    end

    private
    def fetch_revision
      capture("cd #{repo_path} && git rev-parse --short HEAD")
    end
  end
end
self.extend Bagr::DSL