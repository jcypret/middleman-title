[![Build Status](https://travis-ci.org/jcypret/middleman-title.svg?branch=master)](https://travis-ci.org/jcypret/middleman-title)

# Middleman Title

This Middleman extension allows you to easily set page titles for your website.

## Setup
Add the following line to `Gemfile`, then run `bundle install`:

    gem 'middleman-title'

After installation, activate the extension in `config.rb`:

    activate :title, site: 'Your Website Name', separator: ' — '

*The separator is optional and will default to a dash.*


## Adding title to layout and pages

In your layout file, you can use the `page_title` helper to output the current page title:

    <title><%= page_title %></title>

Then, add a page `title` to the Frontmatter any page:

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

You can also put the website name first on every page by setting it when you activate the extension:

    activate :title, site: 'Your Website Name', reverse: true

Then on any page where you want the website name to come last, you can set `title_reverse` to false in the Frontmatter:

    ---
    title: The title of this page goes here
    title_reverse: false
    ---


## Multi-level Page Titles

When your website has heirachy, it is sometimes desirable to have multiple parts to the title, such as a category. This can be done by passing an array in the Frontmatter:

    ---
    title:
    - John Doe
    - Staff
    ---

This would output:

    John Doe — Staff — Your Website Name