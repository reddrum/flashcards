class ChecksController < ApplicationController
  def index
    @card = current_user.current_deck_id.nil? ? current_user.cards.time.random.first : current_user.current_deck.cards.time.random.first
  end

  def check
    @card = Card.find(check_params[:card_id])
    verify
  end

  private
    def check_params
      params.require(:check).permit(:card_id, :original)
    end

    def verify
      if @card.check_str(check_params[:original])
        flash[:success] = 'Check OK'
        @card.update_review_date
      else
        flash[:danger] = 'Wrong'
      end
      redirect_to root_path   
    end
end
