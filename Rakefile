require 'spec/rake/spectask'
require 'cucumber/rake/task'

Spec::Rake::SpecTask.new do |t|
  t.warning = true
  t.spec_opts = %w[--format progress --color]
end

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format progress --language ja"
end
