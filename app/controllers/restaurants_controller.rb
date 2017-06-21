class RestaurantsController < ApplicationController


  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.destination = Destination.find(params[:destination_id])
    if @restaurant.save
      redirect_to destination_path(params[:destination_id])
      flash[:notice] = "Le restaurant a été sauvegardé."
    else
      redirect_to destination_path(params[:destination_id])
      flash[:danger] = "Le restaurant n'a pas pu être sauvegardé."
    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to destination_path(@destination)
    flash[:notice] = "Le restaurant a été effacé."
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :review, :photo, :photo_cache)
  end

  end

end
