class ChecksController < ApplicationController
  def new
    @card = Card.time.random
  end

  def create
    @card = Card.find(check_params[:card_id])
    check = @card.check_str(check_params[:original])
    if check
      flash[:success] = 'Check OK'
      @card.update_review_date
    else
      flash[:danger] = 'Wrong'
    end
    redirect_to root_path                   
  end

  private
    def check_params
    params.require(:check).permit(:card_id, :original)
  end
end
