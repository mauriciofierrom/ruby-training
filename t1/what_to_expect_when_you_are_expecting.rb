class FiveMatcher
  def self.evaluate(value)
    value == 5
  end
end

class Expectation
  attr_accessor :value

  def initialize(param)
    @value = param
  end

  def to(matcher)
    return matcher.evaluate(@value)
  end

  def not_to(matcher)
    return !(matcher == @value)
  end

  alias to_not not_to
end

class WhatToExpectWhenYouAreExpecting
  def self.expect(value)
    Expectation.new(value)
  end

  def self.be_five
    FiveMatcher
  end
end
