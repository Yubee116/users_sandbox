require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    # @users = users(:all)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Age", with: @user.age
    fill_in "Email", with: 'user1@example.com'
    fill_in "Firstname", with: @user.firstName
    fill_in "Gender", with: @user.gender
    fill_in "Height", with: @user.height
    fill_in "Lastname", with: @user.lastName
    fill_in "Weight", with: @user.weight
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Age", with: @user.age
    fill_in "Email", with: 'user1@example.com'
    fill_in "Firstname", with: @user.firstName
    fill_in "Gender", with: @user.gender
    fill_in "Height", with: @user.height
    fill_in "Lastname", with: @user.lastName
    fill_in "Weight", with: @user.weight
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit users_url
    click_on "Destroy", match: :first
    accept_confirm 'Are you sure you want to delete the user?'

    assert_text "User was successfully deleted"
  end

  test "should destroy multiple Users" do
    @users = User.all

    visit users_url
    for user in @users do
      check "user_#{user.id}_checkbox"
    end

    click_on "Delete Checked", match: :first
    accept_confirm 'Are you sure you want to delete the selected users?'

    assert_text "Successfully destroyed users"
  end
end
