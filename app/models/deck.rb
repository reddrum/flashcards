class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :user, optional: true
  accepts_nested_attributes_for :user

  validates :title, presence: true

  def current_deck?
    self == user.current_deck
  end
end
