class HotelsController < ApplicationController

  def create
    @hotel= Hotel.new(hotel_params)
    @hotel.destination = Destination.find(params[:destination_id])
    if @hotel.save
      redirect_to destination_path(params[:destination_id])
      flash[:notice] = "L'hôtel a été sauvegardé."
    else
      redirect_to destination_path(params[:destination_id])
      flash[:danger] = "L'hôtel n'a pas pu être sauvegardé."
    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to destination_path(@destination)
    flash[:notice] = "L'hôtel a été effacé."
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :review, :photo, :photo_cache)
  end
end
