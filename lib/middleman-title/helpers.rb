module Middleman
  module Title
    module Helpers

      def page_title
        cur_page_title = current_page.data.page_title
        return cur_page_title unless cur_page_title.nil?

        title = []
        title = add_page_name_to_title(title)
        title = add_website_name_to_title(title)
        title.compact.join(title_separator)
      end

      private
        def title_options
          ::Middleman::TitleExtension.options
        end

        def website_name
          current_page.data.title_site || title_options.site
        end

        def title_separator
          title_options.separator
        end

        def title_reverse
          if current_page.data.title_reverse.nil? == false
            current_page.data.title_reverse
          else
            title_options.reverse
          end
        end

        def page_name
          page_name = current_page.data.title

          if page_name.is_a? Array
            page_name = page_name.join(title_separator)
          end

          page_name
        end

        def add_website_name_to_title(title)
          if current_page.data.title_site == false || website_name == false
            title
          elsif website_name_first?
            title.unshift(website_name)
          else
            title << website_name
          end
        end

        def add_page_name_to_title(title)
          title << page_name
        end

        def website_name_first?
          title_reverse
        end

    end
  end
end
