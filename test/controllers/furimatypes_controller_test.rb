require 'test_helper'

class FurimatypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get furimatypes_index_url
    assert_response :success
  end

end
