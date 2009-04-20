module PikiDoc
  module Bundles
    module PluginAdapter
      RE = /\A([a-z]+)\(.[^\)]+\)/
      def accept?(src)
        (name,_), = src.scan(RE)
        name == plugin_name
      end

      def inline_plugin(src)
        %Q[<span class='plugin #{plugin_name}'>#{plugin(src)}</span>]
      end

      def block_plugin(src)
        %Q[<div class='plugin #{plugin_name}'>#{plugin(src)}</div>]
      end

      private
      def plugin(src); raise NotImplementedError; end
      def plugin_name; self.class.name.split("::").last.downcase; end
    end
  end
end

