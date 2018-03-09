=begin
So, symbols and strings. They are different kind of objects.

Main difference? Symbols are inmutable. Apparently so inmutable that up to version 2.2 they were also INMORTAL. I.e. the ruby GC did not collect them unless they were created usin the to_sym method. Weird? Indeed. This led to some weird DoS attack related to them. But, who in their right minds would be still working on a ruby version that old? Who indeed...

Anyhow, what's the way to check this? What if I'm lying? What if people from the
coastal region weren't as honorable as people from the high lands believe us to be? What would Hector think?!

The main way is to check the id. When creating a string literal, its id changes everytime,
which means that a new object is created everytime we use a string literal. When usin symbols, however, the id is always the same, we are refering to the same object EVERYWHEEEEERE.

To check the id out we can use the #__id__ #object_id methods

Upon further investigation, this seems to be true for string and symbols and other common objects, and the integer represents the VALUE that represents the object at the C level. It's the mem location the object is stored at. That's why it's dynamic. Awesome, BUTT! 

This seems to be a little different with some objects, namely: false, true, nil and Fixnum i. Their values are 0, 20?, 8? and i*2+1 respectively. 

Before you think WOW THIS DUDE IS BONKERS SMART, HOLY SMOKES. I got this little piece of trivia from this Stack Overflow question https://stackoverflow.com/questions/3430280/how-does-object-id-assignment-work. God bless that sacred place.

Now, ONWARDS TO THE EXAMPLE!

=end

puts 'When lifelessly chanting VOTE FOR PEDRO we get different ids every goddamned time'

puts 'VOTE FOR PEDRO'.__id__
puts 'VOTE FOR PEDRO'.__id__
puts 'VOTE FOR PEDRO'.__id__

puts 'Now all the ids should magically be the same, for the illuminati symbol'

puts :illuminati.__id__
puts :illuminati.__id__
puts :illuminati.__id__
puts :illuminati.object_id

puts 'Interesting? Barely. On to the next example.'
