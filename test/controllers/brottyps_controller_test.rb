require 'test_helper'

class BrottypsControllerTest < ActionController::TestCase
  setup do
    @brottyp = brottyps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brottyps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brottyp" do
    assert_difference('Brottyp.count') do
      post :create, brottyp: { name: @brottyp.name }
    end

    assert_redirected_to brottyp_path(assigns(:brottyp))
  end

  test "should show brottyp" do
    get :show, id: @brottyp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brottyp
    assert_response :success
  end

  test "should update brottyp" do
    patch :update, id: @brottyp, brottyp: { name: @brottyp.name }
    assert_redirected_to brottyp_path(assigns(:brottyp))
  end

  test "should destroy brottyp" do
    assert_difference('Brottyp.count', -1) do
      delete :destroy, id: @brottyp
    end

    assert_redirected_to brottyps_path
  end
end
