class Flybox < ActiveRecord::Base
  has_many :flies
  belongs_to :user
end
