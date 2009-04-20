require 'uri'
require 'piki_doc/output'
require 'vendor/hikidoc'

class PikiDoc < HikiDoc
  @@plugins ||= []
  class << self
    def plugins; @@plugins; end
    def register(*plugins)
      @@plugins.concat(plugins)
    end

    def lint(plugin)
      [:inline_plugin, :block_plugin].any?{|m| plugin.respond_to?(m) } && \
      plugin.respond_to?(:accept?)
    end

    def to_xhtml(src, options = {})
      new(::PikiDoc::HTMLOutput.new(" />", @@plugins), options).compile(src)
    end

    def to_html(src, options = {})
      new(::PikiDoc::HTMLOutput.new(">"), @@plugins, options).compile(src)
    end
  end

  private
  def compile_uri_autolink(uri)
    if(image?(path = URI(uri).path))
      @output.image_hyperlink(uri, path.split(/\//).last)
    else
      super
    end
  end
end

