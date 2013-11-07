namespace :build do

  desc 'Start a new build'
  task :starting do
  end

  desc 'Started'
  task :started do
  end

  desc 'Updating source code.'
  task :updating do
  end

  desc 'Updated'
  task :updated do
  end

  desc 'Finish the deployment, cleaning up directories.'
  task :finishing do
  end

  desc 'Finished'
  task :finished do
  end

end

desc 'Build a new package.'
task :build do
  set(:building, true)
  %w{ starting started
      updating updated
      publishing published
      finishing finished }.each do |task|
    invoke "build:#{task}"
  end
end
task default: :build
