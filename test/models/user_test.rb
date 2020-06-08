require 'test_helper'

class UserTest < ActiveSupport::TestCase


  test 'should not save user without username' do
    user = User.new
    user.name = 'Test Test'
    user.password_digest = 'asdfasdf'
    assert_not user.save, 'Saved user without username'
  end

  test 'should not save user without password_digest' do
    user = User.new
    user.name = 'Test Test'
    user.username = 'test@test.com'
    assert_not user.save, 'Saved user without password_digest'
  end

  test 'should not save user with bad email address' do
    user = User.new
    user.name = 'Test Test'
    user.username = 'testtest.com'
    assert_not user.save, 'Saved user without password_digest'
  end

  test 'should save with all required field' do
    user = User.new
    user.username = 'tes34t@test.com'
    user.name = 'test test'
    user.password_digest = 'asdfasdf'
    assert user.save
  end

end
