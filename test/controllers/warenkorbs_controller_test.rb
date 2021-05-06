require 'test_helper'

class WarenkorbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warenkorb = warenkorbs(:one)
  end

  test "should get index" do
    get warenkorbs_url
    assert_response :success
  end

  test "should get new" do
    get new_warenkorb_url
    assert_response :success
  end

  test "should create warenkorb" do
    assert_difference('Warenkorb.count') do
      post warenkorbs_url, params: { warenkorb: { abholdatum: @warenkorb.abholdatum, gast: @warenkorb.gast, gutschein: @warenkorb.gutschein, notiz: @warenkorb.notiz, user_id: @warenkorb.user_id } }
    end

    assert_redirected_to warenkorb_url(Warenkorb.last)
  end

  test "should show warenkorb" do
    get warenkorb_url(@warenkorb)
    assert_response :success
  end

  test "should get edit" do
    get edit_warenkorb_url(@warenkorb)
    assert_response :success
  end

  test "should update warenkorb" do
    patch warenkorb_url(@warenkorb), params: { warenkorb: { abholdatum: @warenkorb.abholdatum, gast: @warenkorb.gast, gutschein: @warenkorb.gutschein, notiz: @warenkorb.notiz, user_id: @warenkorb.user_id } }
    assert_redirected_to warenkorb_url(@warenkorb)
  end

  test "should destroy warenkorb" do
    assert_difference('Warenkorb.count', -1) do
      delete warenkorb_url(@warenkorb)
    end

    assert_redirected_to warenkorbs_url
  end
end
