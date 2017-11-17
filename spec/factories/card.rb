FactoryBot.define do
  factory :card do
    original_text "home"
    translated_text "дом"
    deck
    review_date { Date.today }
  end
end