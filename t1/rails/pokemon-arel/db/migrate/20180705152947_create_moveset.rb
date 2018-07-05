class CreateMoveset < ActiveRecord::Migration[5.2]
  def change
    create_table :move_sets do |t|
      t.integer :pokemon_id
      t.integer :move_id
    end
  end
end
