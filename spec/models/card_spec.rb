require "rails_helper"

RSpec.describe Card, :type => :model do
  
  context "is not valid" do 
    let(:card) { build(:card, original_text: "home", translated_text: "home") }
    it { expect(card).to_not be_valid }
  end

  context "is valid" do
    let(:card) { create(:card) }
    it { expect(card).to be_valid }    
  end

  context "checks" do
    let(:card) { create(:card) }

    it "review_date" do      
      expect(card.review_date.to_s).to eq (Date.today + 3.days).to_s
    end
  end
end

