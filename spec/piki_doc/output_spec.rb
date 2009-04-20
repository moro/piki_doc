require File.expand_path("../spec_helper", File.dirname(__FILE__))
require 'piki_doc/output'

describe PikiDoc::HTMLOutput do
  # {{vote_form('order','お名前', '[勉強会]','PP, Blog, Twitter or Github', 'ひとこと', '[ust設備あり]')}} 
  describe "call inline_plugin() when respond_to?(meth) and accept?()" do
    Spec::Matchers.create :ouptut_content do |expected|
      match do |actual|
        actual.finish.strip.should == expected
      end
    end

    before do
      @input = "plugin/source"

      @plugin = mock("plugin")
      @plugin.should_receive(:respond_to?).with(:inline_plugin).at_least(:once).and_return(true)
      @plugin.should_receive(:respond_to?).with(:block_plugin).at_least(:once).and_return(true)
      @plugin.should_receive(:accept?).with(@input).and_return(true)

      @out = PikiDoc::HTMLOutput.new(suffix = " />", [@plugin]).tap(&:reset)
    end

    describe "inline_plugin" do
      before do
        @plugin.should_receive(:inline_plugin).with(@input).and_return("--out--")
      end

      it "should render plugin output" do
        @out.inline_plugin(@input).should == "--out--"
      end
    end

    describe "block_plugin" do
      before do
        @plugin.should_receive(:block_plugin).with(@input).and_return("--block--")
      end

      it "should render plugin output" do
        @out.block_plugin(@input)
        @out.should ouptut_content "--block--"
      end
    end
  end
end
