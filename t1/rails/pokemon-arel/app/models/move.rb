class Move < ActiveRecord::Base
  has_many :move_origins
  belongs_to :type
end
