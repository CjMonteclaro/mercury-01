require 'test_helper'

class QuoteVehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote_vehicle = quote_vehicles(:one)
  end

  test "should get index" do
    get quote_vehicles_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_vehicle_url
    assert_response :success
  end

  test "should create quote_vehicle" do
    assert_difference('QuoteVehicle.count') do
      post quote_vehicles_url, params: { quote_vehicle: { quote_id: @quote_vehicle.quote_id, vehicle_id: @quote_vehicle.vehicle_id } }
    end

    assert_redirected_to quote_vehicle_url(QuoteVehicle.last)
  end

  test "should show quote_vehicle" do
    get quote_vehicle_url(@quote_vehicle)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_vehicle_url(@quote_vehicle)
    assert_response :success
  end

  test "should update quote_vehicle" do
    patch quote_vehicle_url(@quote_vehicle), params: { quote_vehicle: { quote_id: @quote_vehicle.quote_id, vehicle_id: @quote_vehicle.vehicle_id } }
    assert_redirected_to quote_vehicle_url(@quote_vehicle)
  end

  test "should destroy quote_vehicle" do
    assert_difference('QuoteVehicle.count', -1) do
      delete quote_vehicle_url(@quote_vehicle)
    end

    assert_redirected_to quote_vehicles_url
  end
end
