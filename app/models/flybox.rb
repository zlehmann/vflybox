class Flybox < ActiveRecord::Base
  belongs_to :user
  has_many :fly_flyboxes
  has_many :flies, through: :fly_flyboxes
end
