require 'test_helper'

class BrotbestellungsControllerTest < ActionController::TestCase
  setup do
    @brotbestellung = brotbestellungs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brotbestellungs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brotbestellung" do
    assert_difference('Brotbestellung.count') do
      post :create, brotbestellung: { email: @brotbestellung.email, name: @brotbestellung.name, telefon: @brotbestellung.telefon, vorname: @brotbestellung.vorname }
    end

    assert_redirected_to brotbestellung_path(assigns(:brotbestellung))
  end

  test "should show brotbestellung" do
    get :show, id: @brotbestellung
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brotbestellung
    assert_response :success
  end

  test "should update brotbestellung" do
    patch :update, id: @brotbestellung, brotbestellung: { email: @brotbestellung.email, name: @brotbestellung.name, telefon: @brotbestellung.telefon, vorname: @brotbestellung.vorname }
    assert_redirected_to brotbestellung_path(assigns(:brotbestellung))
  end

  test "should destroy brotbestellung" do
    assert_difference('Brotbestellung.count', -1) do
      delete :destroy, id: @brotbestellung
    end

    assert_redirected_to brotbestellungs_path
  end
end
