class ActivitiesController < ApplicationController
    def create
    @activity = Activity.new(activity_params)
    @activity.destination = Destination.find(params[:destination_id])
    if @activity.save
      redirect_to destination_path(params[:destination_id])
      flash[:notice] = "L'activité a été sauvegardée."
    else
      redirect_to destination_path(params[:destination_id])
      flash[:danger] = "L'activité n'a pas pu être sauvegardée."
    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to destination_path(@destination)
    flash[:notice] = "L'activité a été effacée."
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :review, :photo, :photo_cache)
  end
end
