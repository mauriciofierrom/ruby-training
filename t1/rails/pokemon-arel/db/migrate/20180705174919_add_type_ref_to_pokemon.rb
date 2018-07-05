class AddTypeRefToPokemon < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :type_id, :integer
  end
end
