require 'test_helper'

class LikeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get like_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get like_comments_destroy_url
    assert_response :success
  end

end
