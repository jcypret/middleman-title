module Middleman
	module Title
		module Helpers

			def page_title
				if current_page_title?
					current_page_title + title_separator + website_title
				else
					website_title + title_separator + website_subtitle
				end
			end

			private
				def title_separator
					' &mdash; '
				end

				def current_page_title?
					current_page.data.title.present?
				end

				def current_page_title
					current_page_title = current_page.data.title
					if current_page_title.is_a? Array
						current_page_title = current_page_title.join(title_separator)
					end
					current_page_title
				end

				def website_title
					data.website.title
				end

				def website_subtitle
					data.website.subtitle
				end

		end
	end
end