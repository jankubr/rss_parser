require File.join(File.dirname(__FILE__), 'spec_helper')

describe RssParser do
  it "should parse feeds that require authentication" do    
    #should start request
    http = stub
    Net::HTTP.expects(:start).yields(http)    
    #response should be success and return sample XML with feed
    response = Net::HTTPSuccess.new('', '', '')
    response.expects(:body).returns(sample_feed_content)
    http.expects(:request).returns(response)
    #should do basic HTTP authorization
    request = stub
    Net::HTTP::Get.expects(:new).returns(request)
    request.expects(:basic_auth).with('user', 'password')

    feed = RssParser.parse('url', 'user', 'password')

    feed.items.first.title.should == 'A book read: My Startup Life by Ben Casnocha'
    feed.items[1].link.should == 'http://jan.flempo.com/2008/12/17/focus-on-incremental-improvements/'
  end
  
  it "should parse feeds that redirect" do    
    #should start request
    http = stub
    Net::HTTP.expects(:start).yields(http)    
    #first response should be redirect
    response = Net::HTTPRedirection.new('', '', '')
    #second response should be success and return sample XML with feed
    second_response = Net::HTTPSuccess.new('', '', '')
    second_response.expects(:body).returns(sample_feed_content)
    response.expects(:[]).with('location').returns('url2')
    http.expects(:request).times(2).returns(response).then.returns(second_response)

    feed = RssParser.parse('url')

    feed.items.first.title.should == 'A book read: My Startup Life by Ben Casnocha'
    feed.items[1].link.should == 'http://jan.flempo.com/2008/12/17/focus-on-incremental-improvements/'
  end
  
  def sample_feed_content
    return @xml if @xml
    File.open(File.join(File.dirname(__FILE__), 'sample_feed.xml')) {|f| @xml = f.read}
    @xml
  end
end