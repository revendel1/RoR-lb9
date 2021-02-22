require 'test_helper'

class MersenControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get mersen_input_url
    assert_response :success
  end

  test "should get view" do
    get mersen_view_url
    assert_response :success
  end

  test "should get count=3 with value=100" do
    get mersen_view_url, params: {val: 100}
    assert_equal assigns[:count], 3
  end

  test "should get count=5 with value=10000" do
    get mersen_view_url, params: {val: 10000}
    assert_equal assigns[:count], 5
  end

  test "should get count=0 with value<=0" do
    value = -100
    get mersen_view_url, params: {val: value}
    assert_equal assigns[:count], 0
  end

  test "should get count=0 with string-value" do
    value = "sometext"
    get mersen_view_url, params: {val: value}
    assert_equal assigns[:count], 0
  end
end
