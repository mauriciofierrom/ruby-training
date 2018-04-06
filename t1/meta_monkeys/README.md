# Rubí - A metaprogramming and monkey patching-powered celebration of the Spanish language

## Prelude
The code above was written with the Spanish language in mind, so it knows
that it hasn't been forgotten by all software developers. Hang in there Español.

## What the code does
First, we are monkey-patching the `Kernel` module to be able to expose the methods anywhere.
Then we create our own `puts` method, which is short for *put string*. In spanish: *poner cadena*.
Nice, sexy and can dance salsa :dancer:.

```ruby
  module Kernel
    def poner_cadena(str)
      puts str
    end
  ...
```

Then we create our own class `clase` (which is actually a factory but I'll try and make a real
class sometime).

We use `instance_eval` to evaluate all the block passed as a parameter to the `clase` method
in the context of the newly created instance. It's counterpart and archenemy is `class_eval` which,
you might've guessed it, evaluates code at the class-level.

```ruby
  ...
  def clase(klass, &block)
    instance = Clase.new
    instance.instance_eval(&block)
    instance
  end
  ...
```

Now, here things get a turn for the complejo (complex). We create our own attribute macros. To do it
we use METAPROGRAMMING.

> Abusing metaprogramming can lead to some nasty results that vary from a 
nightmare of an app design, to actual security vulnerabilities.
> From the app design part, it can be useful for sharing code but the downsides of using it wrong parallel
> with inheritance's. You must be really sure that the abstraction is the right one, and if not, it is really costly to change the code.
> From the vulnerabilites side, using `send` & `eval` pose various security issues. `send` allows to execute
> private methods of objects, as it just bypasses encapsulation. `eval` straight up allows arbitrary execution of code.
> So, Handle with care :tm:. If you're a toddler rubyist, do not use.

We use the `method_missing` eh... method, to capture all non existing eh... methods in the `Clase` class. One thing
here. It is important to always pair `method_missing` with `respond_to_method_missing` in order to curate the
missing methods that are actually going to be handled, and no more, so we keep everything under control and Avoid surprises :tm:. We
can then just allow method dispatching to chain upwards to modules and parent classes.

>That being said, in this case we are trying to capture all methods that aren't Spanish Syntax (also the name
>of my developers-only salsa dancing group) to use lambdas to mimic Function Syntax (developers-only theater
group).

We first capture all our Spanish Syntax methods and then apply another metaprogramming function:
`define_singleton_method` which defines a method in the current instance. We just pass the name
of the function and the block, which handles paremeters and everything for us.

```ruby
  ...
  else
    define_singleton_method(name, args[0])
  end
  ...
```

We handle `attr_reader`, `attr_writer` and `attr_accessor` in Spanish. What these methods do is
create methods for getting or setting an instance variable. So first, we create the instance variable using
`instance_variable_set` which needs a name and a default creationg value, which is ok to leave as `nil`

The methods are:

```ruby
  # attr_reader :a
  def a
    @a
  end

  # attr_writer :a
  def a=(value)
    @a = value
  end

  # attr_accesor :a does both above methods
```

And so we create all these methods:

```ruby
  def method_missing(name, *args, &block)
      if name == :atributo_de_lectura
        instance_variable_set("@#{args[0]}".to_sym, nil)
        define_singleton_method("#{args[0]}", -> do
          instance_variable_get("@#{args[0]}")
        end)
      elsif name == :atributo_de_escritura
        instance_variable_set("@#{args[0]}".to_sym, nil)
        define_singleton_method("#{args[0]}=", ->(param) do
          instance_variable_set("@#{args[0]}", param)
        end)
      elsif name == :atributo_de_acceso
        atributo_de_escritura args[0]
        atributo_de_lectura args[0]
  ...
```

That's all there is to it. We can then create objects with the given attribute accessors 
in Spanish and even define methods, which will Just Work :tm:
