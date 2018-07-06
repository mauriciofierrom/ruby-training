require 'pp'

Dir['./app/models/*'].each {|f| load f}

golduck = Pokemon.where(number: 55)
water_type = Type.where(name: 'Water')

# All Pokemons with moves of type water that appear on generation 7
# While generating the graph of the Arel-based query I ran out of memory D:
pp golduck.moves.joins(Move.join_by_origin_by_type(water_type))
pp Pokemon
  .joins({ moves: :move_origins })
  .where(["moves.type_id=? AND move_origins.generation=?",
          golduck.id,
          water_type.id])

Pokemon.joins({ moves: :move_origins }).where(["moves.type_id=? AND move_origins.generation=?", golduck.id, water_type.id])
