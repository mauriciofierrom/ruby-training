class CreateMoveOrigin < ActiveRecord::Migration[5.2]
  def change
    create_table :move_origins do |t|
      t.string :name
      t.integer :value
      t.integer :generation
    end
  end
end
