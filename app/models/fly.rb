class Fly < ActiveRecord::Base
  has_many :fly_flyboxes
  has_many :flyboxes, through: :fly_flyboxes
end
