require 'test_helper'

class RankingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ranking_index_url
    assert_response :success
  end

  test "should get category" do
    get ranking_category_url
    assert_response :success
  end

end
