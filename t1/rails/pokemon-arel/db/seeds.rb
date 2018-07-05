Dir['./app/models/*'].each {|f| load f}

water_type =  Type.create(name: 'Water')
flying_type = Type.create(name: 'Flying')
psychic_type = Type.create(name: 'Psychic')

golduck = Pokemon.create(number: 55,
                         name: 'Golduck',
                         height: 0.8,
                         weight: 19.6,
                         color: 'blue',
                         type: water_type)


aerial_ace = Move.create(name: 'Aerial Ace',
                         accuracy: 100,
                         base_power: 60,
                         description: 'This move does not check accuracy',
                         short_description: 'some desc',
                         pp: 20,
                         target: 'any',
                         type: flying_type)

MoveOrigin.create(name: 'TM/HM',
                  value: 0,
                  generation: 7,
                  move: aerial_ace)

MoveOrigin.create(name: 'TM/HM',
                  value: 0,
                  generation: 6,
                  move: aerial_ace)

MoveOrigin.create(name: 'TM/HM',
                  value: 0,
                  generation: 5,
                  move: aerial_ace)

MoveOrigin.create(name: 'TM/HM',
                  value: 0,
                  generation: 4,
                  move: aerial_ace)

MoveOrigin.create(name: 'TM/HM',
                  value: 0,
                  generation: 3,
                  move: aerial_ace)

MoveSet.create(move: aerial_ace,
               pokemon: golduck)

bubblebeam = Move.create(name: 'Bubblebeam',
                         type: water_type)

MoveOrigin.create(name: 'Virtual Console',
                  value: 0,
                  generation: 7,
                  move: bubblebeam)

MoveSet.create(move: bubblebeam,
               pokemon: golduck)

zen_headbutt = Move.create(name: 'Zen Headbutt',
                           type: psychic_type)

MoveOrigin.create(generation: 7,
                  move: zen_headbutt)

MoveOrigin.create(generation: 6,
                  move: zen_headbutt)

MoveOrigin.create(generation: 5,
                  move: zen_headbutt)

MoveOrigin.create(generation: 4,
                  move: zen_headbutt)

MoveOrigin.create(name: 'Level',
                  generation: 4,
                  value: 4,
                  move: zen_headbutt)

MoveSet.create(move: zen_headbutt,
               pokemon: golduck)
