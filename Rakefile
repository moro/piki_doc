$: << "./lib"
require 'piki_doc'

require 'rake/clean'
require 'rake/testtask'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'spec/rake/spectask'
require 'cucumber/rake/task'

NAME              = ENV["GEMNAME"] || "piki_doc"
HOMEPAGE          = "http://github.com/moro/#{NAME}/"
AUTHOR            = "MOROHASHI Kyosuke"
EMAIL             = "moronatural@gmail.com"
DESCRIPTION       = "extended HikiDoc to able to plug plugins."
VERS              = PikiDoc::Version

CLEAN.include ['**/.*.sw?', '*.gem', '.config']
RDOC_OPTS = [
  '--title', "#{NAME} documentation",
  "--charset", "utf-8",
  "--opname", "index.html",
  "--line-numbers",
  "--main", "README.ja.hiki",
  "--inline-source",
]

Spec::Rake::SpecTask.new do |t|
  t.warning = true
  t.spec_opts = %w[--format progress --color]
end

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format progress --language ja"
end

gemspec = Gem::Specification.new do |s|
  s.name              = NAME
  s.version           = VERS
  s.platform          = Gem::Platform::RUBY
  s.has_rdoc          = false
  s.extra_rdoc_files  = ["README.ja.hiki", "ChangeLog"]
  s.rdoc_options     += RDOC_OPTS + ['--exclude', '^(examples|extras)/']
  s.summary           = DESCRIPTION
  s.description       = DESCRIPTION
  s.author            = AUTHOR
  s.email             = EMAIL
  s.homepage          = HOMEPAGE
  s.executables       = []
  s.require_path      = "lib"
  s.test_files        = Dir["spec/**/*_spec.rb"] + Dir["features/**/*.rb"] + Dir["features/*.feature"]

  s.files = %w(README.ja.hiki ChangeLog Rakefile) +
    Dir.glob("{bin,doc,lib,templates,generators,extras,website,script}/**/*") + 
    Dir.glob("ext/**/*.{h,c,rb}") +
    Dir.glob("examples/**/*.rb") +
    Dir.glob("tools/*.rb") +
    Dir.glob("rails/*.rb")

  s.extensions = FileList["ext/**/extconf.rb"].to_a
end

Rake::GemPackageTask.new(gemspec) do |p|
  p.need_tar = true
  p.gem_spec = gemspec
end

task :install do
  name = "#{NAME}-#{VERS}.gem"
  sh %{rake package}
  sh %{gem install pkg/#{name}}
end

task :uninstall => [:clean] do
  sh %{gem uninstall #{NAME}}
end

desc 'Show information about the gem.'
task :debug_gem do
  puts gemspec.to_ruby
end

desc 'Update gem spec'
task :gemspec do
  open("#{NAME}.gemspec", 'w').write spec.to_ruby
end

desc "output example from README.ja.hiki"
task "readme_example" do
  require 'piki_doc'
  require 'piki_doc/bundles/gist'
  require 'piki_doc/bundles/asin'

  PikiDoc.register(PikiDoc::Bundles::Gist.new, PikiDoc::Bundles::Asin.new)
  puts PikiDoc.to_xhtml(File.read("README.ja.hiki"))
end

