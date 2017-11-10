class DecksController < ApplicationController
  before_action :find_deck, except: [:index, :new, :create]

  def index
    @decks = current_user.decks.all.order("created_at DESC")
  end

  def new
    @deck = current_user.decks.new
  end

  def show
    @cards = @deck.cards
  end

  def create
    @deck = current_user.decks.new(deck_params)

    if @deck.save
      redirect_to @deck
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @deck.update(deck_params)
      redirect_to decks_path
    else
      render :edit
    end
  end

  def destroy    
    @deck.destroy

    redirect_to decks_path
  end

  def current_on
    current_user.update_attributes(current_deck_id: params[:id])
    @deck.set_current
    redirect_to decks_path
  end

  private

    def deck_params
      params.require(:deck).permit(:title, :id)
    end

    def find_deck
      @deck = current_user.decks.find(params[:id])
    end

end
