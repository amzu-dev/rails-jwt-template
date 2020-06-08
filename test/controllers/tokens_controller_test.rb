require 'test_helper'

class TokensControllerTest < ActionDispatch::IntegrationTest
  test 'create new user' do
    post '/tokens', params: { username: 'test22@test.com', password: 'test', name: 'test name' }
    assert_response :success
  end

end
