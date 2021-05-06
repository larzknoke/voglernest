require "application_system_test_case"

class KategoriesTest < ApplicationSystemTestCase
  setup do
    @kategory = kategories(:one)
  end

  test "visiting the index" do
    visit kategories_url
    assert_selector "h1", text: "Kategories"
  end

  test "creating a Kategorie" do
    visit kategories_url
    click_on "New Kategorie"

    check "Aktiv" if @kategory.aktiv
    fill_in "Brotbestellung", with: @kategory.brotbestellung
    fill_in "Name", with: @kategory.name
    fill_in "Produkt", with: @kategory.produkt_id
    click_on "Create Kategorie"

    assert_text "Kategorie was successfully created"
    click_on "Back"
  end

  test "updating a Kategorie" do
    visit kategories_url
    click_on "Edit", match: :first

    check "Aktiv" if @kategory.aktiv
    fill_in "Brotbestellung", with: @kategory.brotbestellung
    fill_in "Name", with: @kategory.name
    fill_in "Produkt", with: @kategory.produkt_id
    click_on "Update Kategorie"

    assert_text "Kategorie was successfully updated"
    click_on "Back"
  end

  test "destroying a Kategorie" do
    visit kategories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kategorie was successfully destroyed"
  end
end
