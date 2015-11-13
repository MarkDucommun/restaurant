class Owner < ActiveRecord::Base
  devise :database_authenticatable, :registerable

  has_many :owners_restaurants
  has_many :restaurants, through: :owners_restaurants
end
