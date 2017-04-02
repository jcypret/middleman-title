# Middleman Title
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3a4898c9e6d746c9a02f02c25496b8c9)](https://www.codacy.com/app/jcypret/middleman-title?utm_source=github.com&utm_medium=referral&utm_content=jcypret/middleman-title&utm_campaign=badger)
[![Build Status](https://travis-ci.org/jcypret/middleman-title.svg?branch=master)](https://travis-ci.org/jcypret/middleman-title)
[![Code Climate](https://codeclimate.com/github/jcypret/middleman-title.png)](https://codeclimate.com/github/jcypret/middleman-title)

This Middleman extension allows you to easily set page titles for your website.

## Setup
Add the following line to `Gemfile`, then run `bundle install`:

```Ruby
gem 'middleman-title'
```

After installation, activate the extension in `config.rb`:

```Ruby
activate :title, site: 'Your Website Name', separator: ' — '
```

*The separator is optional and will default to a dash.*


## Setting Title and Adding to Layout

In your layout file, you can use the `page_title` helper to output the current page title:

```HTML+ERB
<title><%= page_title %></title>
```

Then, add a page `title` to the Frontmatter any page:

```YAML
---
title: The title of this page goes here
---
```

This would output:

```Text
The title of this page goes here — Your Website Name
```

## Outputting Website Name First

Sometimes it is desirable to put the website name first, such as on the home page. This can be done by setting `title_reverse` to `true` in the frontmatter of the page.

```YAML
---
title: The title of this page goes here
title_reverse: true
---
```

This would output:

```Text
Your Website Name — The title of this page goes here
```

You can also put the website name first on every page by setting it when you activate the extension:

```Ruby
activate :title, site: 'Your Website Name', reverse: true
```

Then on any page where you want the website name to come last, you can set `title_reverse` to false in the Frontmatter:

```YAML
---
title: The title of this page goes here
title_reverse: false
---
```


## Multi-level Page Titles

When your website has heirachy, it is sometimes desirable to have multiple parts to the title. This can be done by passing an array in the Frontmatter:

```YAML
---
title:
- John Doe
- Staff
---
```

This would output:

```Text
John Doe — Staff — Your Website Name
```

## Override Page Title

If at any point you want to completely override the page title, you can use `page_title` in the Frontmatter.

```YAML
page_title: The title of a page to be used as-is in <title> without site name
```

## Contributing

1. Fork it ( https://github.com/jcypret/middleman-title/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
