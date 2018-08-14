require 'test_helper'

class ChargeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @charge_type = charge_types(:one)
  end

  test "should get index" do
    get charge_types_url
    assert_response :success
  end

  test "should get new" do
    get new_charge_type_url
    assert_response :success
  end

  test "should create charge_type" do
    assert_difference('ChargeType.count') do
      post charge_types_url, params: { charge_type: { creator_id: @charge_type.creator_id, name: @charge_type.name, shortname: @charge_type.shortname } }
    end

    assert_redirected_to charge_type_url(ChargeType.last)
  end

  test "should show charge_type" do
    get charge_type_url(@charge_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_charge_type_url(@charge_type)
    assert_response :success
  end

  test "should update charge_type" do
    patch charge_type_url(@charge_type), params: { charge_type: { creator_id: @charge_type.creator_id, name: @charge_type.name, shortname: @charge_type.shortname } }
    assert_redirected_to charge_type_url(@charge_type)
  end

  test "should destroy charge_type" do
    assert_difference('ChargeType.count', -1) do
      delete charge_type_url(@charge_type)
    end

    assert_redirected_to charge_types_url
  end
end
