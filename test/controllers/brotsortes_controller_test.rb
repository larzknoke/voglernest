require 'test_helper'

class BrotsortesControllerTest < ActionController::TestCase
  setup do
    @brotsorte = brotsortes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brotsortes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brotsorte" do
    assert_difference('Brotsorte.count') do
      post :create, brotsorte: { aktiv: @brotsorte.aktiv, ausverkauft: @brotsorte.ausverkauft, name: @brotsorte.name }
    end

    assert_redirected_to brotsorte_path(assigns(:brotsorte))
  end

  test "should show brotsorte" do
    get :show, id: @brotsorte
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brotsorte
    assert_response :success
  end

  test "should update brotsorte" do
    patch :update, id: @brotsorte, brotsorte: { aktiv: @brotsorte.aktiv, ausverkauft: @brotsorte.ausverkauft, name: @brotsorte.name }
    assert_redirected_to brotsorte_path(assigns(:brotsorte))
  end

  test "should destroy brotsorte" do
    assert_difference('Brotsorte.count', -1) do
      delete :destroy, id: @brotsorte
    end

    assert_redirected_to brotsortes_path
  end
end
