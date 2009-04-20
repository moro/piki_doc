require File.expand_path("spec_helper", File.dirname(__FILE__))
require 'piki_doc'

describe PikiDoc do
  describe "to_xhtml(normal_image_link)" do
    subject{ PikiDoc.to_xhtml('http://image.exmaple.com/image.jpg') }

    it{ should == "<p><img src=\"http://image.exmaple.com/image.jpg\" alt=\"image.jpg\" /></p>\n"}
  end

  describe "to_xhtml(image_link_with_param)" do
    subject{ PikiDoc.to_xhtml('http://image.exmaple.com/image.jpg?size=100x75') }

    it{ should == "<p><img src=\"http://image.exmaple.com/image.jpg?size=100x75\" alt=\"image.jpg\" /></p>\n"}
  end

  describe "register(plugin)" do
    before(:all) do
      PikiDoc.register(Object.new, Object.new)
    end

    it{ PikiDoc.should have(2).plugins }
  end
end

