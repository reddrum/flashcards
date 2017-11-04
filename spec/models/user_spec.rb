require 'rails_helper'

RSpec.describe User, type: :model do
  context "is not valid" do 
    let(:user) { build(:user, email:"", password:"", password_confirmation:"") }
    it { expect(user).to_not be_valid }
  end

  context "create a new" do
    let(:user) { create(:user) }
    it { expect(user.email).to eq "qwerty@gmail.com" }
  end
end
