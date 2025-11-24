# Unique header generation
require './lib/unique_head.rb'

# Markdown
set :markdown_engine, :redcarpet

# Configure custom renderer with proper scope handling
ready do
  # Replace the default renderer with our custom one while preserving scope setup
  Middleman::Renderers::MiddlemanRedcarpetHTML.class_eval do
    alias_method :original_header, :header if method_defined?(:header)

    def header(text, header_level)
      @head_count ||= {}
      friendly_text = text.gsub(/<[^>]*>/,"").parameterize
      if friendly_text.strip.length == 0
        require 'digest'
        friendly_text = Digest::SHA1.hexdigest(text)[0,10]
      end
      @head_count[friendly_text] ||= 0
      @head_count[friendly_text] += 1
      if @head_count[friendly_text] > 1
        friendly_text += "-#{@head_count[friendly_text]}"
      end
      return "<h#{header_level} id='#{friendly_text}'>#{text}</h#{header_level}>"
    end
  end
end

set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    strikethrough: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Activate the syntax highlighter
activate :syntax
ready do
  require './lib/monokai_sublime_slate.rb'
  require './lib/multilang.rb'
end

activate :sprockets

# Configure Sass to output compressed CSS which strips comments
set :sass, style: :compressed, line_comments: false

# Autoprefixer temporarily disabled due to issue with SCSS comments in compiled CSS
# activate :autoprefixer do |config|
#   config.browsers = ['last 2 version', 'Firefox ESR']
#   config.cascade  = false
#   config.inline   = false
# end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

# Build Configuration
configure :build do
  # We do want to hash woff and woff2 as there's a bug where woff2 will use
  # woff asset hash which breaks things. Trying to use a combination of ignore and
  # rewrite_ignore does not work as it conflicts weirdly with relative_assets. Disabling
  # the .woff2 extension only does not work as .woff will still activate it so have to
  # have both. See https://github.com/slatedocs/slate/issues/1171 for more details.
  activate :asset_hash, :exts => app.config[:asset_extensions] - %w[.woff .woff2]
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  # activate :minify_css  # Disabled due to issue with Sass compressed output
  # activate :minify_javascript  # Disabled due to ES6 syntax issues
  # activate :gzip
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567

helpers do
  require './lib/toc_data.rb'
end
