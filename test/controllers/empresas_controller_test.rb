require 'test_helper'

class EmpresasControllerTest < ActionDispatch::IntegrationTest
    test "should get new page" do
      get signup_path
      assert_response :success
    end
end
