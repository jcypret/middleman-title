# Middleman Title

This Middleman extension allows you to easily set page titles for your website.

## Setup
Add the following line to `Gemfile`, then run `bundle install`:

    gem 'middleman-title'

After installation, activate the extension in `config.rb`:

    activate :title, name: 'Your Website Name', separator: ' — '

*The separator is optional and will default to a dash.*


## Adding title to layout and pages

Then in your layout, you can use the `page_title` helper to output the current page title:

    <title><%= page_title %></title>

Then, in your the Frontmatter of your template just add a title:

    ---
    title: The title of this page goes here
    ---

This would output:

    The title of this page goes here — Your Website Name

## Outputting Website Name First

Sometimes it is desirable to put the website name first, such as on the home page. This can be done by setting `title_reverse` to `true` in the frontmatter of the page.

    ---
    title: The title of this page goes here
    title_reverse: true
    ---

This would output:

    Your Website Name — The title of this page goes here


## Multi-level Page Titles

When your website has heirachy, it is desirable to include the current section in the page title, such as a category. This can be done by passing an array in the Frontmatter:

    ---
    title:
    - John Doe
    - Staff
    ---

This would output:

    John Doe — Staff — Your Website Name