require "application_system_test_case"

class DirectionsTest < ApplicationSystemTestCase
  setup do
    @direction = directions(:one)
  end

  test "visiting the index" do
    visit directions_url
    assert_selector "h1", text: "Directions"
  end

  test "creating a Direction" do
    visit directions_url
    click_on "New Direction"

    click_on "Create Direction"

    assert_text "Direction was successfully created"
    click_on "Back"
  end

  test "updating a Direction" do
    visit directions_url
    click_on "Edit", match: :first

    click_on "Update Direction"

    assert_text "Direction was successfully updated"
    click_on "Back"
  end

  test "destroying a Direction" do
    visit directions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Direction was successfully destroyed"
  end
end
