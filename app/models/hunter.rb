class Hunter
  has_many :snake_sacks
  has_many :snakes through :snake_sacks
end