require 'uri'
require 'piki_doc/output'
require 'piki_doc/image_uri_autolink_fix'
require 'vendor/hikidoc'

module PikiDoc
  class Document < ::HikiDoc
    @@plugins ||= []
    include ImageUriAutolinkFix

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
  end
end

