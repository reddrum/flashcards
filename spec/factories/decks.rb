FactoryBot.define do
  factory :deck do
    title "deck1"
    user
    factory :deck_with_cards do
      transient do
        cards_count 4
      end

      after(:create) do |deck, evaluator|
        create_list(:card, evaluator.cards_count, deck: deck)
      end
    end
  end
end
