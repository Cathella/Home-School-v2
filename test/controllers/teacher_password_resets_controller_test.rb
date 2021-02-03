require 'test_helper'

class TeacherPasswordResetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teacher_password_resets_new_url
    assert_response :success
  end

end
