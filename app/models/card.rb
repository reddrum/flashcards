class Card < ApplicationRecord
  attr_reader :image_remote_url
  # belongs_to :user, optional: true
  belongs_to :deck, optional: true
  validates :original_text, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :translated_text, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[а-яА-Я]+\z/ }

  has_attached_file :image, styles: { medium: "360x360#", small: "120x120#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :time, -> { where("review_date <= ?", DateTime.now) }
  scope :random, -> { offset(rand(count)) }
  
  before_create do
    self.review_date = DateTime.now.midnight + 3.days
  end

  def check_str(text)
    original_text.casecmp(text.strip).zero?
  end

  def update_review_date
    update_attribute(:review_date, DateTime.now.midnight + 3.days )
  end

  def image_remote_url=(url_value)
    if url_value.present?
      self.image = URI.parse(url_value)
      @image_remote_url = url_value
    end
  end
end