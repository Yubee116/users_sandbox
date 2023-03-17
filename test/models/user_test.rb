require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without email' do
    user = User.new(gender: 'male', height: 170)
    assert_not user.save, 'User should have email'
  end

  test 'should not save user without gender' do
    user = User.new(email: 'user1@example.com', height: 170)
    assert_not user.save, 'User should have gender'
  end

  test 'should not save user without height' do
    user = User.new(email: 'user1@example.com', gender: 'male')
    assert_not user.save, 'User should have height'
  end


  test 'should save user with email, gender and height' do
    user = User.new(email: 'user1@example.com', gender: 'male', height: 170)
    assert user.save
  end

  test 'should not save user with duplicate email' do
    user1 = User.create(email: 'user1@example.com', gender: 'male', height: 170)

    user2 = User.new(email: 'user1@example.com', gender: 'female', height: 175)

    assert_not user2.save
  end
end
