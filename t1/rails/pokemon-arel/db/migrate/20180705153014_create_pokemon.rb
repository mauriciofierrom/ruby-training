class CreatePokemon < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.integer :number
      t.string :name
      t.float :male_ratio
      t.float :female_ratio
      t.float :height
      t.float :weight
      t.string :color
    end
  end
end
