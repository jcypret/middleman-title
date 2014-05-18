require 'middleman-title/helpers'

module Middleman
  module Title
    class << self

      def registered(app, options_hash = {}, &block)
        app.helpers Helpers
        @@options = options_hash
      end

      def options
        @@options
      end

    end
  end
end
