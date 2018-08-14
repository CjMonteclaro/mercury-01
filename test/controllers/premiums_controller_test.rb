require 'test_helper'

class PremiumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @premium = premiums(:one)
  end

  test "should get index" do
    get premiums_url
    assert_response :success
  end

  test "should get new" do
    get new_premium_url
    assert_response :success
  end

  test "should create premium" do
    assert_difference('Premium.count') do
      post premiums_url, params: { premium: { coverage_duration: @premium.coverage_duration, coverage_limit: @premium.coverage_limit, peril_id: @premium.peril_id, prem_type: @premium.prem_type, premium: @premium.premium, subline_factor: @premium.subline_factor, subline_id: @premium.subline_id, taxed: @premium.taxed } }
    end

    assert_redirected_to premium_url(Premium.last)
  end

  test "should show premium" do
    get premium_url(@premium)
    assert_response :success
  end

  test "should get edit" do
    get edit_premium_url(@premium)
    assert_response :success
  end

  test "should update premium" do
    patch premium_url(@premium), params: { premium: { coverage_duration: @premium.coverage_duration, coverage_limit: @premium.coverage_limit, peril_id: @premium.peril_id, prem_type: @premium.prem_type, premium: @premium.premium, subline_factor: @premium.subline_factor, subline_id: @premium.subline_id, taxed: @premium.taxed } }
    assert_redirected_to premium_url(@premium)
  end

  test "should destroy premium" do
    assert_difference('Premium.count', -1) do
      delete premium_url(@premium)
    end

    assert_redirected_to premiums_url
  end
end
