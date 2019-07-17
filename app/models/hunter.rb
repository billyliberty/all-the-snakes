class Hunter < ActiveRecord::Base
  has_secure_password
  has_many :snake_sacks
end