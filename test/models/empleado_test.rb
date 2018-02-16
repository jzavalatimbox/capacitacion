require 'test_helper'

class EmpleadoTest < ActiveSupport::TestCase

  def setup
    @empleado = Empleado.new(nombre: 'Alfredo Valle', rfc: 'Av. Republica de Peru 418', puesto: 'Developer')
    @empleado.sucursal = sucursals(:sucursal_nueva)
  end

  test "valid empleado" do
    assert @empleado.valid?
  end

  test "invalid without nombre" do
    @empleado.nombre = nil
    refute @empleado.valid?, 'Empleado is valid without nombre present'
    assert_not_nil @empleado.errors[:nombre], 'no validation error for nombre present'
  end

  test "invalid without rfc" do
    @empleado.rfc = nil
    refute @empleado.valid?, 'Empleado is valid without rfc present'
    assert_not_nil @empleado.errors[:rfc], 'no validation error for rfc present'
  end

  test "invalid without sucursal" do
    @empleado.sucursal = nil
    refute @empleado.valid?, 'Empleado is valid without sucursal present'
    assert_not_nil @empleado.errors[:sucursal], 'no validation error for sucursal present'
  end

end
