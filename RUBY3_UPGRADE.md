# Ruby 3.2.2 Upgrade Steps for Middleman Project

## Summary
This document outlines the steps taken to upgrade this Middleman project from Ruby 2.7.8 to Ruby 3.2.2 and fix CSS compilation issues.

## Steps to Reproduce

### 1. Upgrade Ruby Version
```bash
cd /Users/kurt/repos/new/api-docs
echo "3.2.2" > .ruby-version
```

### 2. Clean Old Dependencies
```bash
rm -rf Gemfile.lock vendor/bundle .bundle
```

### 3. Update Gemfile
Update the `Gemfile` with Ruby 3.2+ compatible versions:

```ruby
source 'https://rubygems.org'

ruby '>=2.7.0'

# Middleman - using 4.3.x for better compatibility
gem 'middleman', '~> 4.3.0'
gem 'middleman-syntax', '~> 3.2.0'
gem 'middleman-autoprefixer', '~> 2.10.0'
gem 'middleman-sprockets', '~> 4.1.0'
gem 'rouge', '~> 3.26'
gem 'redcarpet', '~> 3.5.0'
gem 'nokogiri', '~> 1.13.0'
gem 'haml', '~> 5.2'  # Pin to Haml 5.x for middleman-syntax compatibility

gem 'execjs'
gem 'mini_racer', platforms: :ruby

# Standard libraries removed from Ruby 3.4+
gem 'mutex_m'
gem 'webrick'
gem 'base64'
gem 'bigdecimal'
```

### 4. Install Gems
```bash
bundle install
```

### 5. Fix config.rb - Remove Incompatible Renderer
Edit `config.rb`:

**Remove this line:**
```ruby
renderer: UniqueHeadCounter
```

**From the markdown configuration block, so it looks like:**
```ruby
# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true
```

### 6. Configure Sprockets to Handle JS Only (Not CSS)
In `config.rb`, configure Sprockets to only process JavaScript files:

```ruby
# Configure Sprockets to handle JS only, not CSS
activate :sprockets do |c|
  c.supported_output_extensions = ['.js']
end
```

**Why this works:**
- Sprockets handles JavaScript bundling (needed for navigation to work)
- Middleman's native Sass compiler handles CSS (properly inlines all `@import` statements)
- Without this, Sprockets tries to handle CSS but doesn't inline `@import` statements, causing 404 errors

### 7. Disable Autoprefixer
In `config.rb`, comment out autoprefixer (causes CSS syntax errors with Ruby 3.2):

```ruby
# Autoprefixer disabled - causes CSS syntax errors with Ruby 3.2
# activate :autoprefixer do |config|
#   config.browsers = ['last 2 version', 'Firefox ESR']
#   config.cascade  = false
#   config.inline   = true
# end
```

### 8. Update Sass Imports to Use Double Quotes
In `source/stylesheets/screen.css.scss` and `source/stylesheets/print.css.scss`, change single quotes to double quotes for imports:

```scss
@charset "utf-8";
@import "normalize";
@import "variables";
@import "icon-font";
```

### 9. Add Comment to _normalize.scss
Add a comment at the top of `source/stylesheets/_normalize.scss` to force Sass to inline it:

```scss
/*! normalize.css v3.0.2 | MIT License | git.io/normalize */
// Force Sass to inline this file instead of emitting a runtime @import
```

### 10. Run Middleman
```bash
bundle exec middleman server
```

## What Changed

### Key Issues Fixed:
1. **UniqueHeadCounter renderer** - Incompatible with Ruby 3.2's Redcarpet initialization
2. **Sprockets** - Was not properly inlining Sass `@import` statements, causing 404 errors
3. **Autoprefixer** - Causing CSS syntax errors with Ruby 3.2
4. **Sass compilation** - Switched from Sprockets to Middleman's native Sass compiler

### Why It Works Now:
- **Native Sass compilation** (without Sprockets) properly inlines all `@import` statements
- The CSS is fully compiled into single files (`screen.css` and `print.css`)
- All partials (`_normalize.scss`, `_variables.scss`, `_icon-font.scss`) are expanded inline
- Font URLs are properly resolved to `/fonts/` paths

## Files Modified
- `.ruby-version` - Changed to `3.2.2`
- `Gemfile` - Updated gem versions for Ruby 3.2 compatibility
- `config.rb` - Removed UniqueHeadCounter, disabled Sprockets and Autoprefixer
- `source/stylesheets/screen.css.scss` - Changed imports to double quotes
- `source/stylesheets/print.css.scss` - Changed imports to double quotes
- `source/stylesheets/_normalize.scss` - Added inline comment
- `.gitignore` - Added `/gems/`, `/extensions/`, `/vendor/bundle/`

## Git Ignore
Make sure `.gitignore` includes:
```
/gems/
/extensions/
/vendor/bundle/
```

This prevents large binary files from being committed.

## Notes
- `bin/` and `specifications/` directories are safe to commit (small text files)
- Gems are now installed to system location (`~/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/`)
- Use `bundle exec middleman server` to run (not just `middleman server`)

