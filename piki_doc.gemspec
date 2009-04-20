# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{piki_doc}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["MOROHASHI Kyosuke"]
  s.date = %q{2009-04-20}
  s.description = %q{extended HikiDoc to able to plug plugins.}
  s.email = %q{moronatural@gmail.com}
  s.extra_rdoc_files = ["README.ja.hiki", "ChangeLog"]
  s.files = ["README.ja.hiki", "ChangeLog", "Rakefile", "lib/piki_doc", "lib/piki_doc/bundles", "lib/piki_doc/bundles/asin.rb", "lib/piki_doc/bundles/gist.rb", "lib/piki_doc/bundles/plugin_adapter.rb", "lib/piki_doc/document.rb", "lib/piki_doc/image_uri_autolink_fix.rb", "lib/piki_doc/output.rb", "lib/piki_doc.rb", "lib/vendor", "lib/vendor/hikidoc.rb", "spec/piki_doc/document_spec.rb", "spec/piki_doc/output_spec.rb", "spec/piki_doc_spec.rb", "features/step_definitions/pluggable_hikidoc_steps.rb", "features/support/env.rb", "features/asin_plugin.feature", "features/gist_plugin.feature"]
  s.homepage = %q{http://github.com/moro/piki_doc/}
  s.rdoc_options = ["--title", "piki_doc documentation", "--charset", "utf-8", "--opname", "index.html", "--line-numbers", "--main", "README.ja.hiki", "--inline-source", "--exclude", "^(examples|extras)/"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{extended HikiDoc to able to plug plugins.}
  s.test_files = ["spec/piki_doc/document_spec.rb", "spec/piki_doc/output_spec.rb", "spec/piki_doc_spec.rb", "features/step_definitions/pluggable_hikidoc_steps.rb", "features/support/env.rb", "features/asin_plugin.feature", "features/gist_plugin.feature"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
