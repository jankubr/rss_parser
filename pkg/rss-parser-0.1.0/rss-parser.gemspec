# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rss-parser}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jan Kubr"]
  s.date = %q{2008-12-25}
  s.description = %q{Simple RSS parser that supports feeds with HTTP Basic Authentication}
  s.email = %q{jan.kubr@gmail.com}
  s.extra_rdoc_files = ["lib/rss_parser.rb", "README.rdoc"]
  s.files = ["features/rss_parsing.feature", "features/steps/rss_steps.rb", "lib/rss_parser.rb", "Rakefile", "README.rdoc", "spec/rss_spec.rb", "spec/sample_feed.xml", "spec/spec_helper.rb", "Manifest", "rss-parser.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/honza/rss-parser}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rss-parser", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rss-parser}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Simple RSS parser that supports feeds with HTTP Basic Authentication}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
