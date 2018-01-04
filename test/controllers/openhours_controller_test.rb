require 'test_helper'

class OpenhoursControllerTest < ActionController::TestCase
  setup do
    @openhour = openhours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:openhours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create openhour" do
    assert_difference('Openhour.count') do
      post :create, openhour: { ende: @openhour.ende, spezial: @openhour.spezial, start: @openhour.start, tag: @openhour.tag }
    end

    assert_redirected_to openhour_path(assigns(:openhour))
  end

  test "should show openhour" do
    get :show, id: @openhour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @openhour
    assert_response :success
  end

  test "should update openhour" do
    patch :update, id: @openhour, openhour: { ende: @openhour.ende, spezial: @openhour.spezial, start: @openhour.start, tag: @openhour.tag }
    assert_redirected_to openhour_path(assigns(:openhour))
  end

  test "should destroy openhour" do
    assert_difference('Openhour.count', -1) do
      delete :destroy, id: @openhour
    end

    assert_redirected_to openhours_path
  end
end
