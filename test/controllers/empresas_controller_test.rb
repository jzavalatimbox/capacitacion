require 'test_helper'

class EmpresasControllerTest < ActionDispatch::IntegrationTest
    test "should get new page" do
      get empresas_path
      assert_response :success
    end
end
