class CreateOwnersRestaurants < ActiveRecord::Migration
  def change
    create_table :owners_restaurants do |t|
      t.belongs_to :owner, null: false
      t.belongs_to :restaurant, null: false
    end
  end
end
