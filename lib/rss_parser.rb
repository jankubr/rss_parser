require 'net/http'
require 'uri'
require 'ostruct'

require 'nokogiri'

class Feed
  attr_accessor :items
  attr_accessor :title, :link, :description, :generator, :language
  
  def initialize(title, link, description)
    @title = title
    @link = link
    @description = description
    @items = []
  end

  def item(params)
    @items << OpenStruct.new(params)
  end
end

class RssParser
  attr_accessor :feed
  
  def self.parse(url, user = nil, password = nil)
    rss = new(url, user, password)
    rss.process
    rss.feed
  end

  def initialize(url, user, password)
    @url = URI.parse(url)
    @user = user
    @password = password
  end
  
  def process
    Net::HTTP.start(@url.host, @url.port) do |http|      
      data = get_data(http, prepare_request(@url.path))
      @feed = parse(data)
    end
  end

private  

  def get_data(http, request, limit = 10)
    raise "Too many redirects" if limit == 0
    response = http.request(request)    
    case response
      when Net::HTTPSuccess 
        response.body
      when Net::HTTPRedirection                
        get_data(http, prepare_request(response['location']), limit - 1)
      else
        response.error!
    end      
  end
  
  def prepare_request(path)
    request = Net::HTTP::Get.new(path)
    request.basic_auth(@user, @password) if @user
    request
  end

  def parse(xml)
    doc = Nokogiri::XML(xml)
    title = sub_element(doc, 'rss/channel/title')
    link = sub_element(doc, 'rss/channel/link')
    description = sub_element(doc, 'rss/channel/description')
    feed = Feed.new(title, link, description)
    doc.xpath('rss/channel[1]//item').each do |item|      
      title = sub_element(item, 'title')
      link = sub_element(item, 'link')      
      description = sub_element(item, 'description')
      pub_date = sub_element(item, 'pubDate')
      feed.item(:title => title, :description => description, 
                :link => link, :pub_date => pub_date)
    end
    feed
  end
  
  def sub_element(element, name)
    element.xpath("#{name}[1]").first.content
  end
end

