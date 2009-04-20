require File.expand_path("../spec_helper", File.dirname(__FILE__))
require 'piki_doc/document'

describe PikiDoc::Document do
  describe "to_xhtml(image_link_with_param)" do
    subject{ PikiDoc::Document.to_xhtml('http://image.exmaple.com/image.jpg?size=100x75') }

    it{ should == "<p><img src=\"http://image.exmaple.com/image.jpg?size=100x75\" alt=\"image.jpg\" /></p>\n"}
  end

  describe "register(plugin)" do
    before(:all) do
      PikiDoc::Document.register(Object.new, Object.new)
    end

    it{ PikiDoc::Document.should have(2).plugins }
  end
end

