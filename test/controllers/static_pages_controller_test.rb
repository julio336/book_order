require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get btc" do
    get static_pages_btc_url
    assert_response :success
  end

  test "should get eth" do
    get static_pages_eth_url
    assert_response :success
  end

  test "should get ltc" do
    get static_pages_ltc_url
    assert_response :success
  end
end
