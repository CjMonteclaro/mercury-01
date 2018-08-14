require 'test_helper'

class SublinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subline = sublines(:one)
  end

  test "should get index" do
    get sublines_url
    assert_response :success
  end

  test "should get new" do
    get new_subline_url
    assert_response :success
  end

  test "should create subline" do
    assert_difference('Subline.count') do
      post sublines_url, params: { subline: { from: @subline.from, line_id: @subline.line_id, name: @subline.name, shortname: @subline.shortname, to: @subline.to } }
    end

    assert_redirected_to subline_url(Subline.last)
  end

  test "should show subline" do
    get subline_url(@subline)
    assert_response :success
  end

  test "should get edit" do
    get edit_subline_url(@subline)
    assert_response :success
  end

  test "should update subline" do
    patch subline_url(@subline), params: { subline: { from: @subline.from, line_id: @subline.line_id, name: @subline.name, shortname: @subline.shortname, to: @subline.to } }
    assert_redirected_to subline_url(@subline)
  end

  test "should destroy subline" do
    assert_difference('Subline.count', -1) do
      delete subline_url(@subline)
    end

    assert_redirected_to sublines_url
  end
end
