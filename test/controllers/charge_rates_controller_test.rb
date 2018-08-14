require 'test_helper'

class ChargeRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @charge_rate = charge_rates(:one)
  end

  test "should get index" do
    get charge_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_charge_rate_url
    assert_response :success
  end

  test "should create charge_rate" do
    assert_difference('ChargeRate.count') do
      post charge_rates_url, params: { charge_rate: { charge_type_id: @charge_rate.charge_type_id, qualifier: @charge_rate.qualifier, rate: @charge_rate.rate, rate_type: @charge_rate.rate_type } }
    end

    assert_redirected_to charge_rate_url(ChargeRate.last)
  end

  test "should show charge_rate" do
    get charge_rate_url(@charge_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_charge_rate_url(@charge_rate)
    assert_response :success
  end

  test "should update charge_rate" do
    patch charge_rate_url(@charge_rate), params: { charge_rate: { charge_type_id: @charge_rate.charge_type_id, qualifier: @charge_rate.qualifier, rate: @charge_rate.rate, rate_type: @charge_rate.rate_type } }
    assert_redirected_to charge_rate_url(@charge_rate)
  end

  test "should destroy charge_rate" do
    assert_difference('ChargeRate.count', -1) do
      delete charge_rate_url(@charge_rate)
    end

    assert_redirected_to charge_rates_url
  end
end
