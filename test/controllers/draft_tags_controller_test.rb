require "test_helper"

class DraftTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draft_tag = draft_tags(:one)
  end

  test "should get index" do
    get draft_tags_url, as: :json
    assert_response :success
  end

  test "should create draft_tag" do
    assert_difference("DraftTag.count") do
      post draft_tags_url, params: { draft_tag: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show draft_tag" do
    get draft_tag_url(@draft_tag), as: :json
    assert_response :success
  end

  test "should update draft_tag" do
    patch draft_tag_url(@draft_tag), params: { draft_tag: {  } }, as: :json
    assert_response :success
  end

  test "should destroy draft_tag" do
    assert_difference("DraftTag.count", -1) do
      delete draft_tag_url(@draft_tag), as: :json
    end

    assert_response :no_content
  end
end
