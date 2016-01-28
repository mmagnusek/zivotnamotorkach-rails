class Admin::PostcardsController < AdminController
  def index
    @postcards = Postcard.page(params[:page])
  end

  def post
    @postcard = Postcard.find(params[:id])
    if @postcard.update(sent_at: Time.now)
      redirect_to [:admin, :postcards], notice: 'Postcard was sent.'
    else
      redirect_to [:admin, :postcards]
    end
  end
end
