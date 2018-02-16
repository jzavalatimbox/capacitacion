require 'test_helper'

class EmpresaTest < ActiveSupport::TestCase

  def setup
    @empresa = Empresa.new(nombre_completo: 'Jesus Zavala', email: 'zavala@gmail.com', rfc: 'ZAVJ931223A89', nombre_empresa: 'Zavala', password: 'passwordtest', password_confirmation: 'passwordtest')
  end

  test "valid empresa" do
    assert @empresa.valid?
  end

  test "invalid without nombre completo" do
    @empresa.nombre_completo = nil
    refute @empresa.valid?, 'Empresa is valid without nombre completo'
    assert_not_nil @empresa.errors[:nombre_completo], 'no validation error for nombre completo present'
  end

  test "invalid without email" do
    @empresa.email = nil
    refute @empresa.valid?, 'Empresa is valid without email'
    assert_not_nil @empresa.errors[:email], 'no validation error for email present'
  end

  test "invalid without rfc" do
    @empresa.rfc = nil
    refute @empresa.valid?, 'Empresa is valid without rfc'
    assert_not_nil @empresa.errors[:rfc], 'no validation error for rfc present'
  end

  test "invalid without nombre empresa" do
    @empresa.nombre_empresa = nil
    refute @empresa.valid?, 'Empresa is valid without nombre empresa'
    assert_not_nil @empresa.errors[:nombre_empresa], 'no validation error for nombre empresa present'
  end

  test "invalid without password" do
    @empresa.password = nil
    refute @empresa.valid?, 'Empresa is valid without password'
    assert_not_nil @empresa.errors[:password], 'no validation error for password present'
  end

end
