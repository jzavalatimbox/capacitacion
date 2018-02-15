class Empleado < ApplicationRecord
  belongs_to :sucursal
  validates :nombre, presence: true
  validates :rfc, presence: true
end
