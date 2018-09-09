require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get notes_show_url
    assert_response :success
  end

end
