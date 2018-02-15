class CreateEmpresas < ActiveRecord::Migration[5.1]
  def change
    create_table :empresas do |t|
      t.string :nombre_completo
      t.string :email
      t.string :rfc
      t.string :nombre_empresa
      t.string :password_digest
      t.timestamps
    end
  end
end
