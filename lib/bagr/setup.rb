include Bagr::DSL

namespace :load do
  task :defaults do
    load 'bagr/defaults.rb'
  end
end

Rake::Task.define_task('build') do

  invoke 'load:defaults'
  load build_config_path
  load "bagr/#{fetch(:scm)}.rb"
  I18n.locale = fetch(:locale, :en)
end
