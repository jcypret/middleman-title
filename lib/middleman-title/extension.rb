require 'middleman-title/helpers'

module Middleman
  module Title

    class Options < Struct.new(:site, :separator, :reverse)
      def initialize(h)
        super(*h.values_at(:site, :separator, :reverse))
      end
    end

    class << self

      def options
        @@options
      end

      def registered(app, options_hash = {}, &block)
        options = Options.new(options_hash)
        yield options if block_given?

        # default options
        options.separator ||= ' &mdash; '
        options.site      = false if options.site.nil?
        options.reverse   = false if options.reverse.nil?

        @@options = options
        app.helpers Helpers
      end
      alias :included :registered

    end

  end
end
