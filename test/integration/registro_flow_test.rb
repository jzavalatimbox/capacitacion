require 'test_helper'

class RegistroFlowTest < ActionDispatch::IntegrationTest

    test "can see register page" do
      get "/signup"
      assert_select "h1", "Registrar Empresa"
    end

    test "can register empresa" do
      get "/signup"
      assert_response :success

      post "/empresas",
        params: { empresa: { nombre_completo: "Jesus Zavala", nombre_empresa: "Zavala Co.", email: "test@timbox.com.mx", rfc: "ZAVJ931223A89", password: "pass123", password_confirmation: "pass123"}}
        assert_response :redirect
        follow_redirect!
        follow_redirect!
        assert_response :success
        assert_select "h1", "No hay sucursales"
    end

    test "can sign in" do
      get "/login"
      assert_response :success

      post "/login",
        params: { session: {  email: "jesus.zavala@timbox.com.mx", password: "testpassword"}}
        assert_response :redirect
        follow_redirect!
        assert_response :success
        assert_select "h1", "Sucursales"
    end

end
