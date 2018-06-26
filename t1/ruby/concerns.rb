=begin
So, Concerns. Active Record, in it's Active Support component, provides with
Concerns, which basically extend ruby's default module functionality. It does so
by providing special methods -included-, -class_methods- and -append features-.
=end

module Trainable
  extend ActiveSupport::Concern

  included do
    def sum_exp_points
    end
  end
end

module Catchable
  extend ActiveSupport::Concern
  included do
    def is_catched
    end
  end
end

=begin
This allows for better dependency management in modules. Every module's included callback uses the base parameter.

As modules are a sort of complement to duck-typin, specially when we need to share behavior between classes that aren't related, it's customary to name concerns with -able.
=end
