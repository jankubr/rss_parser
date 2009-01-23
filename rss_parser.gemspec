# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rss_parser}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jan Kubr"]
  s.date = %q{2009-01-23}
  s.description = %q{Simple RSS parser that supports feeds with HTTP Basic Authentication}
  s.email = %q{jan.kubr@gmail.com}
  s.extra_rdoc_files = ["lib/rss_parser.rb", "README.rdoc"]
  s.files = ["features/rss_parsing.feature", "features/steps/rss_steps.rb", "lib/rss_parser.rb", "Rakefile", "README.rdoc", "spec/rss_spec.rb", "spec/sample_feed.xml", "spec/spec_helper.rb", "Manifest", "rss_parser.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/honza/rss_parser}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rss_parser", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rss_parser}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Simple RSS parser that supports feeds with HTTP Basic Authentication}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<simple-rss>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<simple-rss>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<simple-rss>, [">= 0"])
  end
end
