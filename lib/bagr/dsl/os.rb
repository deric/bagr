
module Bagr
  module DSL
    module OS

      def architecture
        case linux
        when /ubuntu|debian/
          return `dpkg-architecture -qDEB_BUILD_ARCH`
        else
          err "Not sure how to determine arch for: #{linux}"
        end
      end

      def linux
        @lsb_release_tag ||= `lsb_release --id --release | cut -d: -f2 | tr A-Z a-z | xargs | tr ' ' '/'`
      end

      def gem_bin
        `gem env | sed -n '/^ *- EXECUTABLE DIRECTORY: */ { s/// ; p }'`
      end

    end
  end
end