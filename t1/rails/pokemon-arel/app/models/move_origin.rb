class MoveOrigin < ActiveRecord::Base
  belongs_to :move

  def self.join_by_origin_by_type(type)
    move_arel = arel_table
    move_origin_arel = MoveOrigin.arel_table

    join_on = move_arel.create_on(move_arel[:id].eq(move_origin_arel[:move_id]).and(move_arel[:type_id].eq(type.id)))
    inner_join = move_arel.create_join(move_origin_arel, join_on)
  end
end
