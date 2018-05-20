class Object

  def complete_inspection
    inspect_fields
    inspect_methods
    inspect_ancestors
  end

  def inspect_fields
    puts "Instance variables"
    p self.instance_variables
    puts "Class variables"
    p self.class.class_variables
    puts "Frozen variables"
    p (self.instance_variables + self.class.class_variables).collect(&:frozen?)
    puts "Constants"
    p self.class.constants
  end

  def inspect_methods
    inspect_instance_methods
    inspect_class_methods
  end

  def inspect_instance_methods
    puts "Public"
    self.public_methods(false).each { |method_name| print_methods(method_name) }
    puts "Protected"
    self.protected_methods(false).each { |method_name| print_methods(method_name) }
    puts "Private methods"
    self.privated_methods(false).each { |method_name| print_methods(method_name) }
    puts "Singleton"
    # Also can be methods(false)
    self.singleton_methods.each { |method_name| print_methods(method_name) }
    puts ""
  end

  def inspect_class_methods
    puts "Public methods"
    self.class.methods(false).each { |method_name| print_class_methods(method_name) }
    puts "Private methods"
    self.class.private_methods(false).each { |method_name| print_class_methods(method_name) }
  end

  def inspect_ancestors(klass=self.class)
    unless klass.nil?
      puts klass.superclass
      inspect_ancestors(klass.superclass)
    end
  end

  def self.print_parameters(parameters)
    # this should be a method to pp the parameters of methods, not to
    # be used only by this methods, but to be used with a regular output
    # of the method method lol

    # case parameters.first
    # when :req
    #   puts "Required argument"
    # when :key
    #   puts "Hash argument"
  end

  private

  def print_methods(method_name)
    puts "Method: #{method_name.to_s}"
    puts "Parameters: #{self.method(method_name).parameters}"
  end

  def print_class_methods(method_name)
    puts "Method: #{method_name.to_s}"
    puts "Parameters: #{self.class.method(method_name).parameters}"
  end

end
