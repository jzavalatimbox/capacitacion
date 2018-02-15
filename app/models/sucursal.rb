class Sucursal < ApplicationRecord
  has_many :empleados, inverse_of: :sucursal, :dependent => :destroy
  belongs_to :empresa
  validates :nombre, presence: true
  accepts_nested_attributes_for :empleados,
      allow_destroy: true,
      :reject_if => proc { |attributes| attributes[:nombr].blank? && attributes[:rfc].blank? }
end
