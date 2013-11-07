module Bagr
  module DSL
    module Env

      def configure_backend
        env.configure_backend
      end

      def fetch(key, default=nil, &block)
        env.fetch(key, default, &block)
      end

      def any?(key)
        value = fetch(key)
        if value && value.respond_to?(:any?)
          value.any?
        else
          !fetch(key).nil?
        end
      end

      def set(key, value)
        env.set(key, value)
      end

      def delete(key)
        env.delete(key)
      end

      def ask(key, value)
        env.ask(key, value)
      end

      def env
        Configuration.env
      end

      def release_timestamp
        env.timestamp.strftime("%Y%m%d%H%M%S")
      end

    end
  end
end
