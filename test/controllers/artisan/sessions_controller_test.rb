require "test_helper"

class Artisan::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get artisan_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get artisan_sessions_create_url
    assert_response :success
  end
end
