require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Address", with: @user.address
    fill_in "Age", with: @user.age
    fill_in "Birthdate", with: @user.birthDate
    fill_in "Bloodgroup", with: @user.bloodGroup
    fill_in "Company", with: @user.company
    fill_in "Email", with: @user.email
    fill_in "Eyecolor", with: @user.eyeColor
    fill_in "Firstname", with: @user.firstName
    fill_in "Gender", with: @user.gender
    fill_in "Hair", with: @user.hair
    fill_in "Height", with: @user.height
    fill_in "Lastname", with: @user.lastName
    fill_in "Phone", with: @user.phone
    fill_in "Weight", with: @user.weight
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Address", with: @user.address
    fill_in "Age", with: @user.age
    fill_in "Birthdate", with: @user.birthDate
    fill_in "Bloodgroup", with: @user.bloodGroup
    fill_in "Company", with: @user.company
    fill_in "Email", with: @user.email
    fill_in "Eyecolor", with: @user.eyeColor
    fill_in "Firstname", with: @user.firstName
    fill_in "Gender", with: @user.gender
    fill_in "Hair", with: @user.hair
    fill_in "Height", with: @user.height
    fill_in "Lastname", with: @user.lastName
    fill_in "Phone", with: @user.phone
    fill_in "Weight", with: @user.weight
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
