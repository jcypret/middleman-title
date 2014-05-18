module Middleman
	module Title
		module Helpers


			def page_title
				title = [current_page_title]
				title = add_website_name_to_title(title)
				title.compact.join(title_separator)
			end

			private
				def options
					Title.options
				end

				def website_name
					options[:name] || nil
				end

				def title_separator
					options[:separator] || ' &mdash; '
				end

				def current_page_title
					current_page_title = current_page.data.title
					if current_page_title.is_a? Array
						current_page_title = current_page_title.join(title_separator)
					end
					current_page_title
				end

				def add_website_name_to_title(title)
					if website_name_first?
						title.unshift(website_name)
					elsif hide_website_name?
						title
					else
						title << website_name
					end
				end

				def current_page_title?
					current_page.data.title.present?
				end

				def website_name_first?
					options[:reverse] || current_page.data.title_reverse == true
				end

				def hide_website_name?
					current_page.data.title_name == false
				end


		end
	end
end