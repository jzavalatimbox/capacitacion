require 'test_helper'

class NewSucursalFlowTest < ActionDispatch::IntegrationTest

  test "can create new sucursal" do
    get "/"
    assert_response :success

    post "/login", params: { session: {  email: "jesus.zavala@timbox.com.mx", password: "testpassword"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Sucursales"

    get "/sucursals/new"
    assert_response :success

    post "/sucursals",
    params: { sucursal: { nombre: "Mi Sucursal", calle: "Av. Alvaro Obregon",
      colonia: "Alvaro Obregon", numero_exterior: 742, numero_interior:10,
      codigo_postal: 21100, ciudad: "Mexicali", pais: "Mexico" }}
    assert_response :redirect
    follow_redirect!
    follow_redirect!
    assert_response :success
    assert_select "h1", "Sucursales"

  end

end
