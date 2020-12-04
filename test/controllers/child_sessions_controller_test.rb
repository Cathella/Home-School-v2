require 'test_helper'

class ChildSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get child_sessions_new_url
    assert_response :success
  end

end
