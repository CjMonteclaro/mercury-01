require 'test_helper'

class PerilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peril = perils(:one)
  end

  test "should get index" do
    get perils_url
    assert_response :success
  end

  test "should get new" do
    get new_peril_url
    assert_response :success
  end

  test "should create peril" do
    assert_difference('Peril.count') do
      post perils_url, params: { peril: { from: @peril.from, line_id: @peril.line_id, name: @peril.name, shortname: @peril.shortname, to: @peril.to } }
    end

    assert_redirected_to peril_url(Peril.last)
  end

  test "should show peril" do
    get peril_url(@peril)
    assert_response :success
  end

  test "should get edit" do
    get edit_peril_url(@peril)
    assert_response :success
  end

  test "should update peril" do
    patch peril_url(@peril), params: { peril: { from: @peril.from, line_id: @peril.line_id, name: @peril.name, shortname: @peril.shortname, to: @peril.to } }
    assert_redirected_to peril_url(@peril)
  end

  test "should destroy peril" do
    assert_difference('Peril.count', -1) do
      delete peril_url(@peril)
    end

    assert_redirected_to perils_url
  end
end
