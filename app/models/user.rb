class User < ActiveRecord::Base
    has_secure_password
    has_many :flyboxes
    has_many :flies_flyboxes
    has_many :flies, through: :flies_flyboxes
end
