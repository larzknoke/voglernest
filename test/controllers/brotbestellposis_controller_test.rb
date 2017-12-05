require 'test_helper'

class BrotbestellposisControllerTest < ActionController::TestCase
  setup do
    @brotbestellposi = brotbestellposis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brotbestellposis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brotbestellposi" do
    assert_difference('Brotbestellposi.count') do
      post :create, brotbestellposi: { brotbestellung_id: @brotbestellposi.brotbestellung_id, brotsorte_id: @brotbestellposi.brotsorte_id, menge: @brotbestellposi.menge }
    end

    assert_redirected_to brotbestellposi_path(assigns(:brotbestellposi))
  end

  test "should show brotbestellposi" do
    get :show, id: @brotbestellposi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brotbestellposi
    assert_response :success
  end

  test "should update brotbestellposi" do
    patch :update, id: @brotbestellposi, brotbestellposi: { brotbestellung_id: @brotbestellposi.brotbestellung_id, brotsorte_id: @brotbestellposi.brotsorte_id, menge: @brotbestellposi.menge }
    assert_redirected_to brotbestellposi_path(assigns(:brotbestellposi))
  end

  test "should destroy brotbestellposi" do
    assert_difference('Brotbestellposi.count', -1) do
      delete :destroy, id: @brotbestellposi
    end

    assert_redirected_to brotbestellposis_path
  end
end
