module PikiDoc
  module Bundles
    module PluginAdapter
      RE = /\A([a-z]+)\(.[^\)]+\)/
      def accept?(src)
        (name,_), = src.scan(RE)
        name == plugin_name
      end

      def inline_plugin(src)
        plugin_dom("span", plugin(src))
      end

      def block_plugin(src)
        plugin_dom("div", plugin(src))
      end

      private
      def plugin(src); raise NotImplementedError; end

      def plugin_name
        self.class.name.split("::").last.
          gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          downcase
      end

      def plugin_dom(tag, content)
        %Q[<#{tag} class='plugin #{plugin_name}'>#{content}</#{tag}>]
      end
    end
  end
end

