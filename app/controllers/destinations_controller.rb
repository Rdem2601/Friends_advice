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
  end

  def search
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
