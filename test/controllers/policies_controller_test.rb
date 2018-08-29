require 'test_helper'

class PoliciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @policy = policies(:one)
  end

  test "should get index" do
    get policies_url
    assert_response :success
  end

  test "should get new" do
    get new_policy_url
    assert_response :success
  end

  test "should create policy" do
    assert_difference('Policy.count') do
      post policies_url, params: { policy: { genweb_bill_no: @policy.genweb_bill_no, genweb_policy_no: @policy.genweb_policy_no, genweb_receipt_no: @policy.genweb_receipt_no, online_policy_no: @policy.online_policy_no, quote_id: @policy.quote_id, user_id: @policy.user_id } }
    end

    assert_redirected_to policy_url(Policy.last)
  end

  test "should show policy" do
    get policy_url(@policy)
    assert_response :success
  end

  test "should get edit" do
    get edit_policy_url(@policy)
    assert_response :success
  end

  test "should update policy" do
    patch policy_url(@policy), params: { policy: { genweb_bill_no: @policy.genweb_bill_no, genweb_policy_no: @policy.genweb_policy_no, genweb_receipt_no: @policy.genweb_receipt_no, online_policy_no: @policy.online_policy_no, quote_id: @policy.quote_id, user_id: @policy.user_id } }
    assert_redirected_to policy_url(@policy)
  end

  test "should destroy policy" do
    assert_difference('Policy.count', -1) do
      delete policy_url(@policy)
    end

    assert_redirected_to policies_url
  end
end
