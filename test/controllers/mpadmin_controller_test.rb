require 'test_helper'

class MpadminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mpadmin_index_url
    assert_response :success
  end

  test "should get mpusers" do
    get mpadmin_mpusers_url
    assert_response :success
  end

  test "should get mpusershow" do
    get mpadmin_mpusershow_url
    assert_response :success
  end

  test "should get contents" do
    get mpadmin_contents_url
    assert_response :success
  end

  test "should get products" do
    get mpadmin_products_url
    assert_response :success
  end

end
