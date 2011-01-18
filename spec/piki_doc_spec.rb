require File.expand_path("spec_helper", File.dirname(__FILE__))
require 'piki_doc'

class HikiComatibilityMatcher
  def initialize(format, hikidoc, options={})
    @format = "to_#{format}"
    @hikidoc = hikidoc
    @options = options
  end

  def matches?(actual)
    actual.send(@format, @hikidoc, @options) == HikiDoc.send(@format, @hikidoc, @options)
  end

  def description
    "compat with " + shorten_content
  end

  def failure_message_for_should
    "should compat but don't compat with " + shorten_content
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

  shared_examples_for "プラグインなしの場合はオリジナルのHikiと同じように動くこと" do
    it { should compat_with_hiki(format, <<-EOS) }
!おはよう
!!こんにちは

 こんばんは
EOS

    it { should compat_with_hiki(format, <<-EOS, :level => 3) }
!おはよう
!!こんにちは

 こんばんは
EOS

    it { should compat_with_hiki(format, <<-EOS) }
- foobar
- piyopiyo

EOS

  end

  shared_examples_for "プラグインありの場合はオリジナルと異なること" do
    it { should_not compat_with_hiki(format, <<-EOS) }
!クエリつき画像リンク
http://image.with.query.example.com/photo.jpg?size=100x75
EOS
  end

  context :xhtml do
    let(:format) { :xhtml }
    it_should_behave_like "プラグインなしの場合はオリジナルのHikiと同じように動くこと"
    it_should_behave_like "プラグインありの場合はオリジナルと異なること"
  end

  context :html do
    let(:format) { :html }
    it_should_behave_like "プラグインなしの場合はオリジナルのHikiと同じように動くこと"
    it_should_behave_like "プラグインありの場合はオリジナルと異なること"
  end
end

