class User < ApplicationRecord
  has_many :decks, dependent: :destroy
  has_many :cards, through: :decks, dependent: :destroy  
  belongs_to :current_deck, class_name: 'Deck', foreign_key: :current_deck_id, optional: true
  # attr_accessible :email, :password, :password_confirmation, :authentications_attributes
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 3}, confirmation: true, if: :new_record?
  validates :password_confirmation, presence: true, if: :new_record?

end
