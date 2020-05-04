class CreateHamburguesas < ActiveRecord::Migration[6.0]
  def change
    create_table :hamburguesas do |t|
      t.string :nombre
      t.text :descripcion
      t.string :imagen
      t.integer :precio

      t.timestamps
    end
  end
end
