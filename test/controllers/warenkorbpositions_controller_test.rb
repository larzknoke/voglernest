require 'test_helper'

class WarenkorbpositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warenkorbposition = warenkorbpositions(:one)
  end

  test "should get index" do
    get warenkorbpositions_url
    assert_response :success
  end

  test "should get new" do
    get new_warenkorbposition_url
    assert_response :success
  end

  test "should create warenkorbposition" do
    assert_difference('Warenkorbposition.count') do
      post warenkorbpositions_url, params: { warenkorbposition: { menge: @warenkorbposition.menge, warenkorb_id: @warenkorbposition.warenkorb_id } }
    end

    assert_redirected_to warenkorbposition_url(Warenkorbposition.last)
  end

  test "should show warenkorbposition" do
    get warenkorbposition_url(@warenkorbposition)
    assert_response :success
  end

  test "should get edit" do
    get edit_warenkorbposition_url(@warenkorbposition)
    assert_response :success
  end

  test "should update warenkorbposition" do
    patch warenkorbposition_url(@warenkorbposition), params: { warenkorbposition: { menge: @warenkorbposition.menge, warenkorb_id: @warenkorbposition.warenkorb_id } }
    assert_redirected_to warenkorbposition_url(@warenkorbposition)
  end

  test "should destroy warenkorbposition" do
    assert_difference('Warenkorbposition.count', -1) do
      delete warenkorbposition_url(@warenkorbposition)
    end

    assert_redirected_to warenkorbpositions_url
  end
end
