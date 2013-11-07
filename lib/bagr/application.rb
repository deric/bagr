module Bagr
  class Application < Rake::Application

    def initialize
      super
      @name = "bagr"
      @rakefiles = %w{bagrfile Bagrfile bagrfile.rb Bagrfile.rb} << bagrfile
    end

    def run
      Rake.application = self
      super
    end

    def sort_options(options)
      options.push(version,dry_run)
      super
    end

    def load_rakefile
      @name = 'bagr'
      super
    end

    def top_level_tasks
      @top_level_tasks
    end

    def exit_because_of_exception(ex)
      if building?
        exit_build_because_of_exception(ex)
      else
        super
      end
    end

    private

    # allows the `bagr install` task to load without a bagrfile
    def bagrfile
      File.expand_path(File.join(File.dirname(__FILE__),'..','Bagrfile'))
    end

    def version
      ['--version', '-V',
       "Display the program version.",
       lambda { |value|
         puts "Bagr Version: #{Bagr::VERSION} (Rake Version: #{RAKEVERSION})"
         exit
       }
      ]
    end

    def dry_run
      ['--dry-run', '-n',
       "Do a dry run without executing actions",
       lambda { |value|
         # TODO implement this
         Configuration.env.set(:backend, :printer)
       }
      ]
    end
  end

end
