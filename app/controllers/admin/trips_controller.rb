class Admin::TripsController < AdminController
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :archive]

  def index
    @trips = Trip.page(params[:page])
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to [:admin, @trip], notice: 'Trip was successfully created.'
    else
      render :new
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to [:admin, @trip], notice: 'Trip was successfully updated.'
    else
      render :edit
    end
  end

  def archive
    @trip.update_columns(archived_at: Time.now)
    redirect_to [:admin, @trip]
  end

  def destroy
    @trip.destroy
    redirect_to admin_trips_url, notice: 'Trip was successfully destroyed.'
  end

  private

  def set_trip
    @trip = Trip.friendly.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(
      :archived_at, :begin_on, :body, :display_on_homepage, :homepage_body,
      :title, :description, :background_image, :label,
      links_attributes: [:id, :kind, :title, :url, :_destroy]
    )
  end
end
