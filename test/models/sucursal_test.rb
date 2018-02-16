require 'test_helper'

class SucursalTest < ActiveSupport::TestCase

  def setup
    @sucursal = Sucursal.new(nombre: 'Sucursal 1', calle: 'Av. Republica de Peru 418', colonia: 'Cuauhtemoc Sur', numero_exterior: 418,
                              numero_interior: 12, codigo_postal: 21200, ciudad: 'Mexicali', pais: 'Mexico')

    @sucursal.empresa = empresas(:timbox)
  end

  test "valid sucursal" do
    assert @sucursal.valid?
  end

  test "invalid without nombre" do
    @sucursal.nombre = nil
    refute @sucursal.valid?, 'Sucursal is valid without nombre present'
    assert_not_nil @sucursal.errors[:nombre], 'no validation error for nombre present'
  end

  test "invalid without empresa" do
    @sucursal.empresa = nil
    refute @sucursal.valid?, 'Sucursal is valid without empresa present'
    assert_not_nil @sucursal.errors[:empresa], 'no validation error for empresa present'
  end

end
