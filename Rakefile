$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('rss-parser', '0.1.0') do |p|
  p.description    = "Simple RSS parser that supports feeds with HTTP Basic Authentication"
  p.url            = "http://github.com/honza/rss-parser"
  p.author         = "Jan Kubr"
  p.email          = "jan.kubr@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }


require 'cucumber/rake/task'
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format pretty"
end

