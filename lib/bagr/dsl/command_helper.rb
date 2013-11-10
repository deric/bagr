module Bagr
  module DSL
    module CommandHelper

      def rake(tasks=[])
        execute :rake, tasks
      end

      def make(tasks=[])
        execute :make, tasks
      end

      def execute(command, args=[])
        Command.new(command, args)
      end

    end
  end
end