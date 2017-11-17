FactoryBot.define do
  factory :user do
    email 'qwerty@gmail.com'
    password '123456'
    password_confirmation '123456'

    factory :user_with_decks do
      transient do 
        decks_count 4
      end

      after(:create) do |user, evaluator|
        create_list(:deck_with_cards, evaluator.decks_count, user: user)
      end
    end  
  end
end
