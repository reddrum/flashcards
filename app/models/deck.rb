class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :user, optional: true

  validates :title, presence: true

  def set_current
    self.user.decks.update_all(current: false)
    update_columns(current: true)
  end

  def self.current_deck
    find_by(current: true)
  end
end
