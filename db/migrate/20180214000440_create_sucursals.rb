class CreateSucursals < ActiveRecord::Migration[5.1]
  def change
    create_table :sucursals do |t|
      t.string :nombre
      t.string :calle
      t.string :colonia
      t.integer :numero_exterior
      t.integer :numero_interior
      t.integer :codigo_postal
      t.string :ciudad
      t.string :pais
      t.integer :empresa_id
      t.timestamps
    end
  end
end
