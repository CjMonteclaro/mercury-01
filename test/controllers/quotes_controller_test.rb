require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { base_prem: @quote.base_prem, coverage_duration: @quote.coverage_duration, coverage_limit: @quote.coverage_limit, gross_prem: @quote.gross_prem, peril_id: @quote.peril_id, premium_id: @quote.premium_id, subline_id: @quote.subline_id, total_charges: @quote.total_charges } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { base_prem: @quote.base_prem, coverage_duration: @quote.coverage_duration, coverage_limit: @quote.coverage_limit, gross_prem: @quote.gross_prem, peril_id: @quote.peril_id, premium_id: @quote.premium_id, subline_id: @quote.subline_id, total_charges: @quote.total_charges } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
