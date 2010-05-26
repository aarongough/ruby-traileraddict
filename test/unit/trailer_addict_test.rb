require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class TrailerAddictTest < Test::Unit::TestCase

  def setup
    register_url_stubs
  end
  
  test "should return base API url" do
    assert_equal "http://api.traileraddict.com/", TrailerAddict.base_api_url
  end
  
  test "should return base search URL" do
    assert_equal "http://www.traileraddict.com/search.php?q=", TrailerAddict.base_search_url
  end
  
  test "get_tag_for should raise ArgumentError if searchterm is not provided" do
    assert_raises ArgumentError do
      TrailerAddict.get_tag_for
    end
  end
  
  test "get_tag_for should return tag for movie" do
    assert_equal 'iron-man', TrailerAddict.get_tag_for("Iron Man")
  end
  
  test "api_call should raise ArgumentError if movie tag is not specified" do
    assert_raises ArgumentError do
      TrailerAddict.api_call
    end
  end
  
  test "api_call should raise ArgumentError if movie tag is not a string" do
    assert_raises ArgumentError do
      TrailerAddict.api_call(1)
    end
  end
  
  test "api_call should return response body" do
    File.open(File.join(File.dirname(__FILE__), "..", "fixtures", "api_response.txt")) do |file|
      expected_response = file.read
      assert expected_response.include?(TrailerAddict.api_call("iron-man"))
    end
  end
  
  test "get_trailer_embed_code should raise ArgumentError if movie title not supplied" do
    assert_raises ArgumentError do
      TrailerAddict.get_trailer_embed_code
    end
  end
  
  test "get_trailer_embed_code should return embed code" do
    embed_code = TrailerAddict.get_trailer_embed_code("Iron Man")
    assert embed_code.include?("<embed")
    assert embed_code.include?("<object")
    assert embed_code.include?("</object>")
    assert embed_code.include?("</embed>")
  end
  
  test "get url returns a response object" do
    test_response = TrailerAddict.get_url("http://example.com/")
    assert_equal 200, test_response.code.to_i
  end
  
  test "getting nonexistent URL returns response object" do
    test_response = TrailerAddict.get_url('http://thisisaurlthatdoesntexist.co.nz')
    assert_equal 404, test_response.code.to_i
  end

end