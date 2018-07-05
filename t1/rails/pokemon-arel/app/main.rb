require 'pp'

Dir['./app/models/*'].each {|f| load f}

golduck = Pokemon.where(number: 55)

water_type = Type.where(name: 'Water')

puts "All moves of type water from generation 7"
# Pokemon.joins({ moves: :move_origins }).where('moves.type_id=1 AND move_origins.generation=7')
# golduck.moves.joins(Move.join_by_origin_by_type(water_type))
