require 'test_helper'

class BrotbestellscheinsControllerTest < ActionController::TestCase
  setup do
    @brotbestellschein = brotbestellscheins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brotbestellscheins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brotbestellschein" do
    assert_difference('Brotbestellschein.count') do
      post :create, brotbestellschein: {  }
    end

    assert_redirected_to brotbestellschein_path(assigns(:brotbestellschein))
  end

  test "should show brotbestellschein" do
    get :show, id: @brotbestellschein
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brotbestellschein
    assert_response :success
  end

  test "should update brotbestellschein" do
    patch :update, id: @brotbestellschein, brotbestellschein: {  }
    assert_redirected_to brotbestellschein_path(assigns(:brotbestellschein))
  end

  test "should destroy brotbestellschein" do
    assert_difference('Brotbestellschein.count', -1) do
      delete :destroy, id: @brotbestellschein
    end

    assert_redirected_to brotbestellscheins_path
  end
end
