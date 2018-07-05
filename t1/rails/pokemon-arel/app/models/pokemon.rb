class Pokemon < ActiveRecord::Base
  belongs_to :type
  has_many :move_sets
  has_many :moves, through: :move_sets
end
