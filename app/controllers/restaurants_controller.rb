class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.owners << current_owner
    if @restaurant.valid?
      redirect_to(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = fetch_restaurant_by_id
  end

  def edit
    @restaurant = fetch_and_authorize_restaurant
  end

  def update
    @restaurant = fetch_and_authorize_restaurant
    if @restaurant.update_attributes(restaurant_params)
      redirect_to(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = fetch_and_authorize_restaurant
    @restaurant.destroy if @restaurant
    redirect_to restaurants_path
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def fetch_and_authorize_restaurant
    restaurant = fetch_restaurant_by_id
    if restaurant.is_owner?(current_owner)
      restaurant
    else
      flash[:error] = 'Unauthorized'
      redirect_to(restaurant)
    end
  end

  def fetch_restaurant_by_id
    Restaurant.find(params.fetch(:id))
  end

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :description,
      :full_address,
      :phone_number
    )
  end
end
