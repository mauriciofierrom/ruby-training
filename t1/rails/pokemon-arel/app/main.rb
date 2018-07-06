require 'pp'

Dir['./app/models/*'].each {|f| load f}

golduck = Pokemon.where(number: 55)
water_type = Type.where(name: 'Water')

# All Pokemons with moves of type water that appear on generation 7
pp golduck.moves.joins(Move.join_by_origin_by_type(water_type))
pp Pokemon
  .joins({ moves: :move_origins })
  .where(["moves.type_id=? AND move_origins.generation=?",
          golduck.id,
          water_type.id])
