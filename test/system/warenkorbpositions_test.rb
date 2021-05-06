require "application_system_test_case"

class WarenkorbpositionsTest < ApplicationSystemTestCase
  setup do
    @warenkorbposition = warenkorbpositions(:one)
  end

  test "visiting the index" do
    visit warenkorbpositions_url
    assert_selector "h1", text: "Warenkorbpositions"
  end

  test "creating a Warenkorbposition" do
    visit warenkorbpositions_url
    click_on "New Warenkorbposition"

    fill_in "Menge", with: @warenkorbposition.menge
    fill_in "Warenkorb", with: @warenkorbposition.warenkorb_id
    click_on "Create Warenkorbposition"

    assert_text "Warenkorbposition was successfully created"
    click_on "Back"
  end

  test "updating a Warenkorbposition" do
    visit warenkorbpositions_url
    click_on "Edit", match: :first

    fill_in "Menge", with: @warenkorbposition.menge
    fill_in "Warenkorb", with: @warenkorbposition.warenkorb_id
    click_on "Update Warenkorbposition"

    assert_text "Warenkorbposition was successfully updated"
    click_on "Back"
  end

  test "destroying a Warenkorbposition" do
    visit warenkorbpositions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warenkorbposition was successfully destroyed"
  end
end
