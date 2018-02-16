require 'test_helper'

class EmpleadosControllerTest < ActionDispatch::IntegrationTest
  test "should get new page" do

    post "/login", params: { session: {  email: "jesus.zavala@timbox.com.mx", password: "testpassword"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Sucursales"

    get new_empleado_path
    assert_response :success
  end

  test "should get edit page" do

    post "/login", params: { session: {  email: "jesus.zavala@timbox.com.mx", password: "testpassword"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Sucursales"

    get edit_empleado_path(empleados(:empleado_1))
    assert_response :success
  end
end
