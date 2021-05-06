require "application_system_test_case"

class BestellungsTest < ApplicationSystemTestCase
  setup do
    @bestellung = bestellungs(:one)
  end

  test "visiting the index" do
    visit bestellungs_url
    assert_selector "h1", text: "Bestellungs"
  end

  test "creating a Bestellung" do
    visit bestellungs_url
    click_on "New Bestellung"

    check "Abgeholt" if @bestellung.abgeholt
    fill_in "Abholdatum", with: @bestellung.abholdatum
    check "Bezahlt" if @bestellung.bezahlt
    fill_in "Noitz", with: @bestellung.noitz
    fill_in "Status", with: @bestellung.status
    fill_in "Total", with: @bestellung.total
    fill_in "User", with: @bestellung.user_id
    fill_in "Zahlungsmethode", with: @bestellung.zahlungsmethode
    click_on "Create Bestellung"

    assert_text "Bestellung was successfully created"
    click_on "Back"
  end

  test "updating a Bestellung" do
    visit bestellungs_url
    click_on "Edit", match: :first

    check "Abgeholt" if @bestellung.abgeholt
    fill_in "Abholdatum", with: @bestellung.abholdatum
    check "Bezahlt" if @bestellung.bezahlt
    fill_in "Noitz", with: @bestellung.noitz
    fill_in "Status", with: @bestellung.status
    fill_in "Total", with: @bestellung.total
    fill_in "User", with: @bestellung.user_id
    fill_in "Zahlungsmethode", with: @bestellung.zahlungsmethode
    click_on "Update Bestellung"

    assert_text "Bestellung was successfully updated"
    click_on "Back"
  end

  test "destroying a Bestellung" do
    visit bestellungs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bestellung was successfully destroyed"
  end
end
