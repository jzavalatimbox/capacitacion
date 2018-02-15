class CreateEmpleados < ActiveRecord::Migration[5.1]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :rfc
      t.string :puesto
      t.integer :sucursal_id
      t.timestamps
    end
  end
end
