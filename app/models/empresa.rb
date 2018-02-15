class Empresa < ApplicationRecord
    has_many :sucursals
    validates :nombre_empresa, presence: true,
              uniqueness: { case_sensitive: false }
    validates :email, presence: true,
              uniqueness: { case_sensitive: false }
    before_save { self.email = email.downcase }
    validates_confirmation_of :password
    has_secure_password
end
