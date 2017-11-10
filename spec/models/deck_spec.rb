require 'rails_helper'

RSpec.describe Deck, type: :model do
  context "is not valid" do 
    let(:user) { create(:user) }
    let(:deck) { build(:deck, title: "") }
    it { expect(deck).to_not be_valid }
  end

  context "create a new" do
    let(:user) { create(:user) }
    let(:deck) { create(:deck) }
    it { expect(deck.title).to eq "deck1" }
  end
end
