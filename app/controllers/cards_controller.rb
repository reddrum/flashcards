class CardsController < ApplicationController
  before_action :find_card, except: [:index, :new, :create]
  before_action :find_deck, only: [:new, :create, :edit, :update, :destroy]

  def index
    @cards = current_user.cards
  end

  def new
    @card = Card.new
  end

  def show  
  end

  def create
    @card = @deck.cards.new(card_params)

    if @card.save
      redirect_to deck_card_url(@card.deck, @card)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to deck_card_url(@deck)
    else
      render 'edit'
    end
  end

  def destroy    
    @card.destroy

    redirect_to deck_url(@deck)
  end

  private
    def card_params
      params.require(:card).permit(:original_text, :translated_text, :image, :image_remote_url, :deck_id)
    end

    def find_card
      @card = current_user.cards.find(params[:id])
    end

    def find_deck
      @deck = current_user.decks.find(params[:deck_id])
    end

    def deck_params
      params.require(:deck).permit(:title)
    end
end
