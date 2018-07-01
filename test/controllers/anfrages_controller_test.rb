require 'test_helper'

class AnfragesControllerTest < ActionController::TestCase
  setup do
    @anfrage = anfrages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anfrages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anfrage" do
    assert_difference('Anfrage.count') do
      post :create, anfrage: {  }
    end

    assert_redirected_to anfrage_path(assigns(:anfrage))
  end

  test "should show anfrage" do
    get :show, id: @anfrage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anfrage
    assert_response :success
  end

  test "should update anfrage" do
    patch :update, id: @anfrage, anfrage: {  }
    assert_redirected_to anfrage_path(assigns(:anfrage))
  end

  test "should destroy anfrage" do
    assert_difference('Anfrage.count', -1) do
      delete :destroy, id: @anfrage
    end

    assert_redirected_to anfrages_path
  end
end
