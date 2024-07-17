require "application_system_test_case"

class BarangaysTest < ApplicationSystemTestCase
  setup do
    @barangay = barangays(:one)
  end

  test "visiting the index" do
    visit barangays_url
    assert_selector "h1", text: "Barangays"
  end

  test "should create barangay" do
    visit barangays_url
    click_on "New barangay"

    fill_in "Family count", with: @barangay.family_count
    click_on "Create Barangay"

    assert_text "Barangay was successfully created"
    click_on "Back"
  end

  test "should update Barangay" do
    visit barangay_url(@barangay)
    click_on "Edit this barangay", match: :first

    fill_in "Family count", with: @barangay.family_count
    click_on "Update Barangay"

    assert_text "Barangay was successfully updated"
    click_on "Back"
  end

  test "should destroy Barangay" do
    visit barangay_url(@barangay)
    click_on "Destroy this barangay", match: :first

    assert_text "Barangay was successfully destroyed"
  end
end
