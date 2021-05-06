require 'test_helper'

class BestellungsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bestellung = bestellungs(:one)
  end

  test "should get index" do
    get bestellungs_url
    assert_response :success
  end

  test "should get new" do
    get new_bestellung_url
    assert_response :success
  end

  test "should create bestellung" do
    assert_difference('Bestellung.count') do
      post bestellungs_url, params: { bestellung: { abgeholt: @bestellung.abgeholt, abholdatum: @bestellung.abholdatum, bezahlt: @bestellung.bezahlt, noitz: @bestellung.noitz, status: @bestellung.status, total: @bestellung.total, user_id: @bestellung.user_id, zahlungsmethode: @bestellung.zahlungsmethode } }
    end

    assert_redirected_to bestellung_url(Bestellung.last)
  end

  test "should show bestellung" do
    get bestellung_url(@bestellung)
    assert_response :success
  end

  test "should get edit" do
    get edit_bestellung_url(@bestellung)
    assert_response :success
  end

  test "should update bestellung" do
    patch bestellung_url(@bestellung), params: { bestellung: { abgeholt: @bestellung.abgeholt, abholdatum: @bestellung.abholdatum, bezahlt: @bestellung.bezahlt, noitz: @bestellung.noitz, status: @bestellung.status, total: @bestellung.total, user_id: @bestellung.user_id, zahlungsmethode: @bestellung.zahlungsmethode } }
    assert_redirected_to bestellung_url(@bestellung)
  end

  test "should destroy bestellung" do
    assert_difference('Bestellung.count', -1) do
      delete bestellung_url(@bestellung)
    end

    assert_redirected_to bestellungs_url
  end
end
