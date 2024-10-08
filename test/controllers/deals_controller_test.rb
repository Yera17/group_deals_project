require "test_helper"

class DealsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get deals_new_url
    assert_response :success
  end

  test "should get create" do
    get deals_create_url
    assert_response :success
  end

  test "should get index" do
    get deals_index_url
    assert_response :success
  end

  test "should get show" do
    get deals_show_url
    assert_response :success
  end
end
