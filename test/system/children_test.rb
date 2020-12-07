require "application_system_test_case"

class ChildrenTest < ApplicationSystemTestCase
  setup do
    @child = children(:one)
  end

  test "visiting the index" do
    visit children_url
    assert_selector "h1", text: "Children"
  end

  test "creating a Child" do
    visit children_url
    click_on "New Child"

    fill_in "Address", with: @child.address
    fill_in "Grade", with: @child.grade
    fill_in "Guardian", with: @child.guardian
    fill_in "Name", with: @child.name
    fill_in "Password digest", with: @child.password_digest
    fill_in "Phone", with: @child.phone
    click_on "Create Child"

    assert_text "Child was successfully created"
    click_on "Back"
  end

  test "updating a Child" do
    visit children_url
    click_on "Edit", match: :first

    fill_in "Address", with: @child.address
    fill_in "Grade", with: @child.grade
    fill_in "Guardian", with: @child.guardian
    fill_in "Name", with: @child.name
    fill_in "Password digest", with: @child.password_digest
    fill_in "Phone", with: @child.phone
    click_on "Update Child"

    assert_text "Child was successfully updated"
    click_on "Back"
  end

  test "destroying a Child" do
    visit children_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Child was successfully destroyed"
  end
end
