require 'rails_helper'
describe Regstrations do
  describe '#create' do
    it "ニックネームが空では登録できない" do
      user = build(:user, nikname: "")
      user.valid?
     expect(user.errors[:nikname]).to include("を入力してください")
    end


  end
end