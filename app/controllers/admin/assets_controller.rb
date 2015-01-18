class Admin::AssetsController < AdminController
  before_action :set_asset, only: [:show, :edit, :update, :destroy, :archive]

  def index
    @assets = Asset.page(params[:page]).includes(:trip)
  end

  def new
    @asset = Asset.new
  end

  def edit
  end

  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      redirect_to [:admin, :assets], notice: 'Asset was successfully created.'
    else
      render :new
    end
  end

  def update
    if @asset.update_attributes(asset_params)
      redirect_to [:admin, :assets], notice: 'Asset was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @asset.destroy
    redirect_to [:admin, :assets], notice: 'Asset was successfully destroyed.'
  end

  private

  def set_asset
    @asset = Asset.find(params[:id])
  end

  def asset_params
    params.require(:asset).permit(:file, :trip_id, :title)
  end
end
