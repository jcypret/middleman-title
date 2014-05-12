module Middleman
	module Title
		class << self

			option :website_name, 'Website Name'
			option :reverse, false
			option 'separator', '&mdash;'

			def registered(app, options_hash = {}, &block)
        app.helpers Middleman::Title::Helpers
      end

		end
	end
end
