class AddMoveRefToMoveOrigin < ActiveRecord::Migration[5.2]
  def change
    add_column :move_origins, :move_id, :integer
  end
end
