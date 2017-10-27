require "rails_helper"

RSpec.describe Card, :type => :model do
  
  context "validate" do 
    let(:card) { create(:card, original_text: "home", translated_text: "home") }

    it "invalid_card" do       
      expect(card).to_not be_valid
    end
  end

  context "checks" do
    let(:card) { create(:card) }

    it "null_review_date" do      
      card.review_date = nil
      expect(card).to_not be_valid
    end
  end
end