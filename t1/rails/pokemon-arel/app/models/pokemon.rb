class Pokemon < ActiveRecord::Base
  belongs_to :type
  has_many :move_sets
  has_many :moves, through: :move_sets

  def find_by_move_type_and_generation(generation, the_type)
    pokemon = self.class.arel_table

    type = Type.arel_table
    move_origin = MoveOrigin.arel_table
    move = Move.arel_table
    move_set = MoveSet.arel_table

    move_set_on = pokemon.create_on(
      move_set[:pokemon_id].eq(pokemon[:id]))
    move_set_join = pokemon.create_join(move_set, move_set_on)

    move_on = move_set_join.create_on(
      move_set[:move_id].eq(move[:id]))
    move_join = move_set_join.create_join(move, move_on)

    move_origin_on = move_join.create_on(
      move_origin[:move_id].eq(move[:id])
      .and(move_origin[:generation].eq(generation)))
    move_origin_join = move_join.create_join(move_origin, move_origin_on)

    type_on = move_origin_join.create_on(
      type[:id].eq(the_type.id)
      .and(type[:id].eq(move[:type_id])))
    type_join = move_origin_join.create_join(type, type_on)

    Pokemon.joins(move_set_join, move_join, move_origin_join, type_join).where(id: id)
  end
end
