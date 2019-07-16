class SnakeSack < ActiveRecord::Base
  belongs_to :hunter 
  has_many :snakes 
end