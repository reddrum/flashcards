class Card < ApplicationRecord
  validates :original_text, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :translated_text, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[а-яА-Я]+\z/ }
  
  before_create do
    self.review_date = DateTime.now.midnight + 3.days
  end
end
