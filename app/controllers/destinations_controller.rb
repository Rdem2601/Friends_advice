class DestinationsController < ApplicationController

  before_action :find_destination, only: [:show, :destroy]

  def index
    @destinations = Destination.where(user_id: current_user.id)
  end

  def new
    @destination = Destination.new
  end

  def show
    @restaurant = Restaurant.new
    @hotel = Hotel.new
    @activity = Activity.new
    restaurant_hash = Gmaps4rails.build_markers(@destination.restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
    end
    hotel_hash = Gmaps4rails.build_markers(@destination.hotels) do |hotel, marker|
        marker.lat hotel.latitude
        marker.lng hotel.longitude
    end
    activity_hash = Gmaps4rails.build_markers(@destination.activities) do |activity, marker|
          marker.lat activity.latitude
          marker.lng activity.longitude
    end
    @hash = restaurant_hash + hotel_hash + activity_hash
    dte = eval(@destination.date)
    @date = "#{dte[3]}/#{dte[2]}/#{dte[1]}"
  end

  def search
    @destinations = Destination.look(params[:search][:query])
    @users = User.search(params[:search][:query])
    @graph = Koala::Facebook::API.new(current_user.token)
    friends = @graph.get_connections("me", "friends")
    @my_array = []
    friends.each do |friend|
      full_name = friend["name"]
      @my_array << full_name
    end
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.user = current_user
    if @destination.save
      redirect_to destinations_path
    else
      render :new
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :date)
  end

  def find_destination
    @destination = Destination.find(params[:id])
  end

end
