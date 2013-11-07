module Bagr
  class VersionValidator

    def initialize(version)
      @version = version
    end

    def verify
      if match?
        self
      else
        fail "Bagrfile locked at #{version}, but #{current_version} is loaded"
      end
    end

    private
    attr_reader :version


    def match?
      available =~ requested
    end

    def current_version
      VERSION
    end

    def available
      Gem::Dependency.new('bagr', version)
    end

    def requested
      Gem::Dependency.new('bagr', current_version)
    end

  end
end
