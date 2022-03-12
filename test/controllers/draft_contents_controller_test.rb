require "test_helper"

=begin
class DraftContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draft_content = draft_contents(:one)
  end

  test "should get index" do
    get draft_contents_url, as: :json
    assert_response :success
  end

  test "should create draft_content" do
    assert_difference("DraftContent.count") do
      post draft_contents_url, params: { draft_content: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show draft_content" do
    get draft_content_url(@draft_content), as: :json
    assert_response :success
  end

  test "should update draft_content" do
    patch draft_content_url(@draft_content), params: { draft_content: {  } }, as: :json
    assert_response :success
  end

  test "should destroy draft_content" do
    assert_difference("DraftContent.count", -1) do
      delete draft_content_url(@draft_content), as: :json
    end

    assert_response :no_content
  end
end
=end
