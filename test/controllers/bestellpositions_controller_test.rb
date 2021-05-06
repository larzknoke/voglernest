require 'test_helper'

class BestellpositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bestellposition = bestellpositions(:one)
  end

  test "should get index" do
    get bestellpositions_url
    assert_response :success
  end

  test "should get new" do
    get new_bestellposition_url
    assert_response :success
  end

  test "should create bestellposition" do
    assert_difference('Bestellposition.count') do
      post bestellpositions_url, params: { bestellposition: { bestellung_id: @bestellposition.bestellung_id, menge: @bestellposition.menge, preis: @bestellposition.preis } }
    end

    assert_redirected_to bestellposition_url(Bestellposition.last)
  end

  test "should show bestellposition" do
    get bestellposition_url(@bestellposition)
    assert_response :success
  end

  test "should get edit" do
    get edit_bestellposition_url(@bestellposition)
    assert_response :success
  end

  test "should update bestellposition" do
    patch bestellposition_url(@bestellposition), params: { bestellposition: { bestellung_id: @bestellposition.bestellung_id, menge: @bestellposition.menge, preis: @bestellposition.preis } }
    assert_redirected_to bestellposition_url(@bestellposition)
  end

  test "should destroy bestellposition" do
    assert_difference('Bestellposition.count', -1) do
      delete bestellposition_url(@bestellposition)
    end

    assert_redirected_to bestellpositions_url
  end
end
