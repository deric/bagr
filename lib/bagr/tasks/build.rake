namespace :build do

  task :starting do
    invoke 'build:check'
  end

  task :updating => :new_release_path do
    invoke "#{scm}:create_release"
  end

  task :finished do
    invoke 'build:log_revision'
  end

  desc 'Check required files and directories exist'
  task :check do
    invoke "#{scm}:check"
  end

  desc 'Log details of the build'
  task :log_revision do
    on roles(:all) do
      within releases_path do
        execute %{echo "#{revision_log_message}" >> #{revision_log}}
      end
    end
  end

  task :restart
  task :failed

end
