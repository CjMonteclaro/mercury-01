require 'test_helper'

class ClaimsTatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claims_tat = claims_tats(:one)
  end

  test "should get index" do
    get claims_tats_url
    assert_response :success
  end

  test "should get new" do
    get new_claims_tat_url
    assert_response :success
  end

  test "should create claims_tat" do
    assert_difference('ClaimsTat.count') do
      post claims_tats_url, params: { claims_tat: { approved: @claims_tat.approved, assigned_to_adjuster: @claims_tat.assigned_to_adjuster, completion_of_document: @claims_tat.completion_of_document, genweb_claim_id: @claims_tat.genweb_claim_id, loa: @claims_tat.loa, out_from_shop: @claims_tat.out_from_shop, payment_request: @claims_tat.payment_request, received_invoice: @claims_tat.received_invoice, to_audit: @claims_tat.to_audit, to_treasury: @claims_tat.to_treasury, with_estimate: @claims_tat.with_estimate } }
    end

    assert_redirected_to claims_tat_url(ClaimsTat.last)
  end

  test "should show claims_tat" do
    get claims_tat_url(@claims_tat)
    assert_response :success
  end

  test "should get edit" do
    get edit_claims_tat_url(@claims_tat)
    assert_response :success
  end

  test "should update claims_tat" do
    patch claims_tat_url(@claims_tat), params: { claims_tat: { approved: @claims_tat.approved, assigned_to_adjuster: @claims_tat.assigned_to_adjuster, completion_of_document: @claims_tat.completion_of_document, genweb_claim_id: @claims_tat.genweb_claim_id, loa: @claims_tat.loa, out_from_shop: @claims_tat.out_from_shop, payment_request: @claims_tat.payment_request, received_invoice: @claims_tat.received_invoice, to_audit: @claims_tat.to_audit, to_treasury: @claims_tat.to_treasury, with_estimate: @claims_tat.with_estimate } }
    assert_redirected_to claims_tat_url(@claims_tat)
  end

  test "should destroy claims_tat" do
    assert_difference('ClaimsTat.count', -1) do
      delete claims_tat_url(@claims_tat)
    end

    assert_redirected_to claims_tats_url
  end
end
