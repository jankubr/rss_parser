require 'rubygems'
require 'spec'
Spec::Runner.configure do |config|
  config.mock_with :mocha
end

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rss_parser'
