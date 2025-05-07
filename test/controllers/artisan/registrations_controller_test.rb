require "test_helper"

class Artisan::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get artisan_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get artisan_registrations_create_url
    assert_response :success
  end
end
