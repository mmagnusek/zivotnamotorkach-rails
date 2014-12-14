class TripsController < ApplicationController
  def show
    @trip = Trip.friendly.find(params[:id])
  end
end
