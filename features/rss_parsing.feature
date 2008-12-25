Feature: RSS feeds parsing
  In order to display my blog posts on another web page
  I want to be able to parse RSS feeds

  Scenario: Parse an RSS feed that does not require authentication
    Given the RSS feed on address "http://jan.flempo.com/feed"
    When the feed is retrieved and parsed
    Then the title of the first item should be the same as when parsed with the Simple RSS library
    And the link of the second item should be the same as when parsed with the Simple RSS library