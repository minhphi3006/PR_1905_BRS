require 'test_helper'

class SaversControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get savers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get savers_destroy_url
    assert_response :success
  end

  test "should get index" do
    get savers_index_url
    assert_response :success
  end

end
