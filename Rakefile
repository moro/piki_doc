$: << "./lib"
require 'spec/rake/spectask'
require 'cucumber/rake/task'

Spec::Rake::SpecTask.new do |t|
  t.warning = true
  t.spec_opts = %w[--format progress --color]
end

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format progress --language ja"
end

desc "output example from README.ja.hiki"
task "readme_example" do
  require 'piki_doc'
  require 'piki_doc/bundles/gist'
  require 'piki_doc/bundles/asin'

  PikiDoc.register(PikiDoc::Bundles::Gist.new, PikiDoc::Bundles::Asin.new)
  puts PikiDoc.to_xhtml(File.read("README.ja.hiki"))
end
