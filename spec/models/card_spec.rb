# require 'rails_helper'

# RSpec.describe Card, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require 'rails_helper'
describe Card do
  describe '#create' do

    context 'log in' do
      before do
        login user
        # card_params  user_id current_user.id 
      end

      it "user_idが空では登録できない" do
        card = build(:card, user_id: "")
        card.valid?
        expect(card.errors[:user_id]).to include("を入力してください")
      end

      it "customer_idが空では登録できない" do
        card = build(:card, customer_id: "")
        card.valid?
        expect(card.errors[:customer_id]).to include("を入力してください")
      end

      it "card_idが空では登録できない" do
        card = build(:card, card_id: "")
        card.valid?
        expect(card.errors[:card_id]).to include("を入力してください")
      end
    end
  end
end