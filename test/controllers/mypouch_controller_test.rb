require 'test_helper'

class MypouchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypouch_index_url
    assert_response :success
  end

  test "should get face" do
    get mypouch_face_url
    assert_response :success
  end

  test "should get survey" do
    get mypouch_survey_url
    assert_response :success
  end

  test "should get keyword" do
    get mypouch_keyword_url
    assert_response :success
  end

  test "should get result" do
    get mypouch_result_url
    assert_response :success
  end

end
