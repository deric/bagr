set :scm, :git
set :branch, :master
set :tmp_dir, "#{fetch(:prj_dir)}/tmp"

set :default_env, {}

set :format, :pretty
set :log_level, :debug

set :pty, false
