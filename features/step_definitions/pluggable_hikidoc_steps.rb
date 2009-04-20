require 'piki_doc'
require 'piki_doc/bundles/gist'
require 'piki_doc/bundles/asin'
require 'nokogiri'

When /^"([^\"]*)"プラグインを登録する$/ do |name|
  PikiDoc.register(PikiDoc::Bundles.const_get(name).new)
end

When /^以下のHiki記法テキストをXHTMLにする$/ do |text|
  @out = PikiDoc.to_xhtml(text)
end

Then /^"([^\"]*)"要素が含まれること$/ do |selector|
  @doc ||= Nokogiri::HTML(@out)
  @doc.css(selector).should_not be_empty
end

When /^"([^\"]*)"要素のテキストは"([^\"]*)"であること$/ do |selector, text|
  @doc ||= Nokogiri::HTML(@out)
  @doc.css(selector).text.should == text
end

When /^結果を目視$/ do
  at_exit{ ["-" * 80, @out, "-" * 80].each{|s| puts s } }
end

