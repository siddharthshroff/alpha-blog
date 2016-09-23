require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest

  test "get user info and sign up" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { username: "test2", email: "test2@example.com", password: "password" }
    end
    assert_template 'users/show'
    assert_match "test", response.body
  end
  
end