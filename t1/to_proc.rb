=begin
SO! Moving on. to_proc or not to_proc.

This method turns an object into a Proc. The & operator, when used on an object,
ANY object, tries to call the -to_proc- from it.

The Symbol is the most used -to_proc- instance. It's defined like this:
=end

class Symbol
  def to_proc
    proc { |obj, args| obj.send(self, *args) }
  end
end

=begin
Or it can also be defined using a lambda, but, as we have previously discussed,
lambdas are more strict about their arguments, so the extra arguments need a default -nil- value.
=end

class Symbol
  def to_proc
    lambda { |obj, args=nil| obj.send(self, *args) }
  end
end

=begin
But, WHAT KINDA SORCERY IS THIS?!

Well, it's just passing the object and the arguments the method needs. The splat
operator is used to pass as many arguments as needed.

This particular instance is implemented using the metaprogramming method -send-.
When using our own instances of to_proc we should consider using public_send only
due to possible vulnerabilites and also to preserve encapsulation properly.

The symbol instance is great for writing concise code. Here are some examples.
=end

[1...42].collect(&:odd).inject(&:+)

=begin
So if we want to add the odd numbers from 1 to 42, we can do that in a clean and sexy fashion.
=end
