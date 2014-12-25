class PagesController < ApplicationController
  def homepage
    @current_trip = Trip.where(archived_at: nil).ordered.first
  end

  def sponsors
  end
end
