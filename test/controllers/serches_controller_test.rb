require "test_helper"

class SerchesControllerTest < ActionDispatch::IntegrationTest
  test "should get serch" do
    get serches_serch_url
    assert_response :success
  end
end
