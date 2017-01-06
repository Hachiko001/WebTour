require 'test_helper'

class OrderGuidesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_guides_create_url
    assert_response :success
  end

  test "should get update" do
    get order_guides_update_url
    assert_response :success
  end

  test "should get destroy" do
    get order_guides_destroy_url
    assert_response :success
  end

end
