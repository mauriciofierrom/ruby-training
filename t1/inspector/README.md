# Inspector Lestrade :mag:
Named after the Scotland Yard's Inspector G. Lestrade, from the Sherlock Holmes
novels and short stories by Arthur Connan Doyle. This is an introspector for
objects, and it's not a good one, just like Inspecpor G. Lestrade was not a good
one, so there you have it, hence the name.

Now that I think about it for a second, if it's an introspector, maybe Rodin's
`The Thinker` would've made a better name. Damn. Anyhow, ONWARDS!

## Introspection
Ruby has a lot of methods for class and object introspection:

### For methods
`methods` returns a list of all public and protected methods, a `boolean`
parameter can be provided to show `singleton` methods instead.

There are more convenient methods for different access levels: `public_methods`,
`protected_methods`, `private_methods` and a method equivalent to using
`methods(false)`: `singleton_methods`.

These methods can be used at the class level as well.

#### Parameters
There's also a nice way to get the parameters of a method by calling the
`method(:name).parameters` method. It returns an array of arrays (if only we had
tuples lol) that contains a pair with the type and the name of the argument.
Here type is not the class or something, is more of a kind (not the FP kind,
this is still not a Haskell training repo).

Some types/kinds are `req` for required variables, `opt` for optional (i.e. that
have a default value), `keyreq` for a required key in a hash parameter. There's
also the possibility to have a `req` type with no name, which means that it
would be a method with a required unnamed parameter, which can't be done via
regular Ruby syntax (that I know off, and trust me, I searched). Checking the
Ruby source code, the specs list all other types/kinds of parameters and also
solves the unnamed required parameter mystery; grouped parameters. You know, the
ones passed to procs, like this `|param1, param2|`. Turns out a method can be
created with the `define_method` method (lol) that can receive this grouped
parameter thing, and it counts as just one parameter, obviously without a name.
Ahh... the world is full of wonders.

### For fields
`instance_variables` works for instance variables, but can only be run on, well,
instances. Duh.

`class_variables` works for class variables, but can only... wait, I'm repeating
myself, and I've used more words than the previous entry. It is still self
explanatory.

`frozen?` is also obvious.

`constants` also is called only from the class level.
