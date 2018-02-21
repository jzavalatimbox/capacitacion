require 'test_helper'

class NewEmpleadoFlowTest < ActionDispatch::IntegrationTest
  test "can create new empleado" do
    get "/"
    assert_response :success

    post "/login", params: { session: {  email: "jesus.zavala@timbox.com.mx", password: "testpassword"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Sucursales"

    get "/empleados/new"
    assert_response :success

    post "/empleados",
    params: { empleado: { nombre: "Cesar Flores", rfc: "FLOC921110H27", puesto: "Developer", sucursal_id: 300280150}}
    assert_response :redirect
    follow_redirect!
    follow_redirect!
    assert_response :success
    assert_select "h1", "Sucursales"

  end

end
