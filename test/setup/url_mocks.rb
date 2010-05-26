def register_url_stubs  
  unless(TEST_LIVE_API)
  
    File.open(File.join(File.dirname(__FILE__), "..", "fixtures", "search.txt")) do |file|
      stub_request(:get, Regexp.new("http:\/\/www.traileraddict.com/search.*")).to_return(file)
    end
    
    File.open(File.join(File.dirname(__FILE__), "..", "fixtures", "api_response.txt")) do |file|
      stub_request(:get, Regexp.new(TrailerAddict.base_api_url + ".*")).to_return(file)
    end
    
    File.open(File.join(File.dirname(__FILE__), "..", "fixtures", "example_com.txt")) do |file|
      stub_request(:get, Regexp.new("http://example.com.*")).to_return(file)
    end
    
    stub_request(:get, 'http://thisisaurlthatdoesntexist.co.nz').to_return(:body => "", :status => 404, :headers => {'content-length' => 0})
    
  end
end