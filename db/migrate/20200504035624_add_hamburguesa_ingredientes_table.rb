class AddHamburguesaIngredientesTable < ActiveRecord::Migration[6.0]
  def change
    create_table(:hamburguesas_ingredientes, id: false) do |t|
      t.belongs_to :hamburguesa
      t.belongs_to :ingrediente
    end
  end
end
