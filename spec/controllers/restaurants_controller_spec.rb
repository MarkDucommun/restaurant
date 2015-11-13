require 'rails_helper'
include Devise::TestHelpers

describe RestaurantsController do
  describe '#create' do
    it 'creates a restaurant in the database' do
      sign_in Owner.create(email: 'a@a.com')
      expect {
        post :create, {
          restaurant: {
            name: 'This is required'
          }
        }
      }.to change(Restaurant, :count).from(0).to(1)
    end
  end

  describe '#destroy' do
    it 'removes a restaurant from the database' do
      owner = Owner.create(email: 'a@a.com')
      restaurant = Restaurant.create(name: 'A name')
      restaurant.owners << owner
      sign_in owner
      expect {
        delete :destroy, id: restaurant.id
      }.to change(Restaurant, :count).by(-1)
    end
  end
end
