class OwnersRestaurant < ActiveRecord::Base
  belongs_to :owner
  belongs_to :restaurant
end
