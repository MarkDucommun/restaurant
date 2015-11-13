class Restaurant < ActiveRecord::Base
  has_many :owners_restaurants
  has_many :owners, through: :owners_restaurants

  validates_presence_of :name

  def is_owner?(an_owner)
    self.owners.include?(an_owner)
  rescue
    false
  end
end
