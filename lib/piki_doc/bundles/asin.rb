module PikiDoc
  module Bundles
    class Asin
      include PluginAdapter
      def initialize(host = "www.amazon.co.jp", iframe_host = "rcm-jp.amazon.co.jp")
        @host = host
        @iframe_host = iframe_host
      end

      def inline_plugin(src)
        (asin, id), = src.scan(/\(\s*'(\d+)',\s*'([a-z0-9\-]+)'\s*\)/)
        plugin_dom("span", <<-HTML)
<a href="http://#{@host}/exec/obidos/ASIN/#{asin}/#{id}/ref=nosim">Amazon</a>
HTML
      end
      def block_plugin(src)
        (asin, id), = src.scan(/\(\s*'(\d+)',\s*'([a-z0-9\-]+)'\s*\)/)
        plugin_dom("div", <<-HTML)
<iframe src="http://#{@iframe_host}/e/cm?t=#{id}&o=9&p=8&l=as1&asins=#{asin}&fc1=000000&IS2=1&lt1=_blank&m=amazon&lc1=0000FF&bc1=000000&bg1=FFFFFF&f=ifr&nou=1"
        style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
HTML
      end
    end
  end
end
