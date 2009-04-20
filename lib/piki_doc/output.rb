require 'vendor/hikidoc'

class PikiDoc < ::HikiDoc
  class HTMLOutput < ::HikiDoc::HTMLOutput
    def initialize(suffix, plugins)
      super(suffix)
      @inlines = plugins.select{|p| p.respond_to?(:inline_plugin) }
      @blocks = plugins.select{|p| p.respond_to?(:block_plugin) }
    end

    def inline_plugin(src)
      if plugin = @inlines.detect{|p| p.accept?(src) }
        plugin.inline_plugin(src)
      else
        super
      end
    end

    def block_plugin(src)
      if plugin = @blocks.detect{|p| p.accept?(src) }
        @f.puts plugin.block_plugin(src)
      else
        super
      end
    end
  end
end
