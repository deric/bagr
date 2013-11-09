namespace :git do

  set :git_environmental_variables, ->() {
    {
      git_askpass: "/bin/echo",
      git_ssh:     "#{fetch(:tmp_dir)}/#{fetch(:application)}/git-ssh.sh"
    }
  }

  desc 'Upload the git wrapper script, this script guarantees that we can script git without getting an interactive prompt'
  task :wrapper do
    execute :mkdir, "-p", "#{fetch(:tmp_dir)}/#{fetch(:application)}/"
    upload! StringIO.new("#!/bin/sh -e\nexec /usr/bin/ssh -o PasswordAuthentication=no -o StrictHostKeyChecking=no \"$@\"\n"), "#{fetch(:tmp_dir)}/#{fetch(:application)}/git-ssh.sh"
    execute :chmod, "+x", "#{fetch(:tmp_dir)}/#{fetch(:application)}/git-ssh.sh"
  end

  desc 'Check that the repository is reachable'
  task check: :'git:wrapper' do
    fetch(:branch)
    with fetch(:git_environmental_variables) do
      exit 1 unless test :git, :'ls-remote', repo_url
    end
  end

  desc 'Clone the repo to the cache'
  task clone: :'git:wrapper' do
    if test " [ -f #{repo_path}/HEAD ] "
      info t(:mirror_exists, at: repo_path)
    else
      within build_path do
        with fetch(:git_environmental_variables) do
          execute :git, :clone, '--mirror', repo_url, repo_path
        end
      end
    end
  end
end
