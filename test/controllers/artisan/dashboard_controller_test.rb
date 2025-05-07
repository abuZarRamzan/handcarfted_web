require "test_helper"

class Artisan::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artisan_dashboard_index_url
    assert_response :success
  end
end
