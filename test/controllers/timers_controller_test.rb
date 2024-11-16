require "test_helper"

class TimersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_timer_url
    assert_response :success
  end

  test "should create timer" do
    post timers_url, params: { timer: { name: "Study Timer", duration: 60 } }
    assert_response :redirect
  end

  test "should show timer" do
    timer = timers(:one) # 適切なfixtureを使用
    get timer_url(timer)
    assert_response :success
  end
end
