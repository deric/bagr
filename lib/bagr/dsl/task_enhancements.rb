module Bagr
  module TaskEnhancements
    def before(task, prerequisite, *args, &block)
      prerequisite = Rake::Task.define_task(prerequisite, *args, &block) if block_given?
      Rake::Task[task].enhance [prerequisite]
    end

    def after(task, post_task, *args, &block)
      Rake::Task.define_task(post_task, *args, &block) if block_given?
      post_task = Rake::Task[post_task]
      Rake::Task[task].enhance do
        post_task.invoke
      end
    end

    def default_tasks
      %w{install}
    end

    def exit_build_because_of_exception(ex)
      warn t(:build_failed, ex: ex.inspect)
      invoke 'build:failed'
      exit(false)
    end

    def building?
      fetch(:building, false)
    end

  end
end
