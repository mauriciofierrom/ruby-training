class CreateMove < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :accuracy
      t.integer :base_power
      t.integer :move_category_id
      t.text :description
      t.text :short_description
      t.integer :pp
      t.string :target
      t.integer :priority
      t.boolean :secondary
      t.boolean :is_viable
      t.integer :type_id
    end
  end
end
