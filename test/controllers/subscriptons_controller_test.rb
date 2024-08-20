require "test_helper"

class SubscriptonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subscriptons_new_url
    assert_response :success
  end

  test "should get create" do
    get subscriptons_create_url
    assert_response :success
  end

  test "should get manage" do
    get subscriptons_manage_url
    assert_response :success
  end

  test "should get update" do
    get subscriptons_update_url
    assert_response :success
  end
end
