require "application_system_test_case"

class WarenkorbsTest < ApplicationSystemTestCase
  setup do
    @warenkorb = warenkorbs(:one)
  end

  test "visiting the index" do
    visit warenkorbs_url
    assert_selector "h1", text: "Warenkorbs"
  end

  test "creating a Warenkorb" do
    visit warenkorbs_url
    click_on "New Warenkorb"

    fill_in "Abholdatum", with: @warenkorb.abholdatum
    check "Gast" if @warenkorb.gast
    fill_in "Gutschein", with: @warenkorb.gutschein
    fill_in "Notiz", with: @warenkorb.notiz
    fill_in "User", with: @warenkorb.user_id
    click_on "Create Warenkorb"

    assert_text "Warenkorb was successfully created"
    click_on "Back"
  end

  test "updating a Warenkorb" do
    visit warenkorbs_url
    click_on "Edit", match: :first

    fill_in "Abholdatum", with: @warenkorb.abholdatum
    check "Gast" if @warenkorb.gast
    fill_in "Gutschein", with: @warenkorb.gutschein
    fill_in "Notiz", with: @warenkorb.notiz
    fill_in "User", with: @warenkorb.user_id
    click_on "Update Warenkorb"

    assert_text "Warenkorb was successfully updated"
    click_on "Back"
  end

  test "destroying a Warenkorb" do
    visit warenkorbs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warenkorb was successfully destroyed"
  end
end
