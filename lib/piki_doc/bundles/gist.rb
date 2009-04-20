require 'piki_doc/bundles/plugin_adapter'

module PikiDoc
  module Bundles
    class Gist
      include PluginAdapter
      def inline_plugin(src)
        (id,), = src.scan(/gist\((\d+)\)/)
        %Q[<a href="http://gist.github.com/#{id}">Gist:#{id}</a>]
      end

      private
      def plugin(src)
        (id,), = src.scan(/gist\((\d+)\)/)
        %Q[<script src="http://gist.github.com/#{id}.js"></script>]
      end
    end
  end
end
