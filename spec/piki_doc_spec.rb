require File.expand_path("spec_helper", File.dirname(__FILE__))
require 'piki_doc'

class HikiComatibilityMatcher
  def initialize(format, hikidoc)
    @format = "to_#{format}"
    @hikidoc = hikidoc
  end

  def matches?(actual)
    actual.send(@format, @hikidoc) == HikiDoc.send(@format, @hikidoc)
  end

  def description
    "compat with " + shorten_content
  end

  def failure_message_for_should
    "should compat but do'nt compat with " + shorten_content
  end

  def failure_message_for_should_not
    "should not compat but compat with " + shorten_content
  end

  private
  def shorten_content(num=50)
    @hikidoc.gsub(/[\r\n]/, "\\n").split(//)[0, num].join("")
  end
end

describe PikiDoc do
  subject{ PikiDoc } # module itself
  def compat_with_hiki(*arg)
    HikiComatibilityMatcher.new(*arg)
  end

  it do should compat_with_hiki(:xhtml, <<-EOS) end
!おはよう
!!こんにちは

 こんばんは
EOS

  it do should compat_with_hiki(:xhtml, <<-EOS) end
- foobar
- piyopiyo

EOS

  it do should_not compat_with_hiki(:xhtml, <<-EOS) end
!クエリつき画像リンク
http://image.with.query.example.com/photo.jpg?size=100x75
EOS

end

