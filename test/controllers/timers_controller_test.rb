require "test_helper"

class TimersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get timers_new_url
    assert_response :success
  end

  test "should get create" do
    get timers_create_url
    assert_response :success
  end

  test "should get show" do
    get timers_show_url
    assert_response :success
  end
end
