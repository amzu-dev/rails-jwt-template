require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test 'Should respond back unauthorised without a valid JWT' do
    get dashboard_index_url
    assert_response 401
  end
end
