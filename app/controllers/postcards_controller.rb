class PostcardsController < ApplicationController
  def new
    @postcard = Postcard.new
  end

  def create
    @postcard = Postcard.new(postcard_params)
    if verify_recaptcha(model: @postcard) && @postcard.save
      redirect_to new_postcard_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  private

  def postcard_params
    params.require(:postcard).permit(:name, :street, :city, :zip_code)
  end
end
