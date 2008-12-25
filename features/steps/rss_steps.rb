require "#{File.dirname(__FILE__)}/../../lib/rss_parser"
require 'spec'
require 'simple-rss'
require 'open-uri'

Given /^the RSS feed on address "(.*)"$/ do |url|
  @url = url 
end

When /the feed is retrieved and parsed/ do
  @feed = RssParser.parse(@url)
end

Then /^the title of the first item should be the same as when parsed with the Simple RSS library$/ do
  SimpleRSS.parse(open(@url)).entries.first.title.should == @feed.items.first.title
end

Then /^the link of the second item should be the same as when parsed with the Simple RSS library$/ do
  SimpleRSS.parse(open(@url)).entries[1].title == @feed.items[1].link
end
