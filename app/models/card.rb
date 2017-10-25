class Card < ApplicationRecord
  validates :original_text, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :translated_text, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[а-яА-Я]+\z/ }

  scope :time, -> { where("review_date <= ?", DateTime.now) }
  scope :random, -> { offset(rand(count)).first }
  
  before_create do
    self.review_date = DateTime.now.midnight + 3.days
  end


  def check_str(text)
    original_text.casecmp(text.strip).zero?
  end

  def update_review_date
    update_attribute(:review_date, DateTime.now.midnight + 3.days )
  end
end
