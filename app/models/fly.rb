class Fly < ActiveRecord::Base
  has_many :flies_flyboxes
  has_many :flyboxes, through: :flies_flyboxes
end
