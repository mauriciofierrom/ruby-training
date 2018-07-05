class Pokemon < ActiveRecord::Base
  belongs_to :type
  has_many :move_sets
  has_many :moves, through: :move_sets

  def find_by_move_type_and_generation(generation, type)
    pkmn = self.arel_table

    type = Type.arel_table
    move_origin = MoveOrigin.arel_table
    move = Move.arel_table
    move_set = MoveSet.arel_table

    move_set_join = a.create_on(
      move_set[:pokemon_id].eq(pkmn[:id])
      .and(move_set[:move_id].eq(move[:id]))
      .and(move_origin[:move_id].eq(move[:id]))
      .and(move_origin[:generation].eq(generation))
      .and(type[:id].eq(type.id))
      .and(type[:id].eq(move[:type_id])))
  end
end
