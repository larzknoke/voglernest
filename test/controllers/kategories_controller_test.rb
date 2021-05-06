require 'test_helper'

class KategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kategory = kategories(:one)
  end

  test "should get index" do
    get kategories_url
    assert_response :success
  end

  test "should get new" do
    get new_kategory_url
    assert_response :success
  end

  test "should create kategory" do
    assert_difference('Kategorie.count') do
      post kategories_url, params: { kategory: { aktiv: @kategory.aktiv, brotbestellung: @kategory.brotbestellung, name: @kategory.name, produkt_id: @kategory.produkt_id } }
    end

    assert_redirected_to kategory_url(Kategorie.last)
  end

  test "should show kategory" do
    get kategory_url(@kategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_kategory_url(@kategory)
    assert_response :success
  end

  test "should update kategory" do
    patch kategory_url(@kategory), params: { kategory: { aktiv: @kategory.aktiv, brotbestellung: @kategory.brotbestellung, name: @kategory.name, produkt_id: @kategory.produkt_id } }
    assert_redirected_to kategory_url(@kategory)
  end

  test "should destroy kategory" do
    assert_difference('Kategorie.count', -1) do
      delete kategory_url(@kategory)
    end

    assert_redirected_to kategories_url
  end
end
