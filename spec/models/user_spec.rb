require 'rails_helper'
describe User do
  describe '#create' do
    it "ニックネームが空では登録できない" do
      user = build(:user, nikname: "")
      user.valid?
     expect(user.errors[:nikname]).to include("を入力してください")
    end

    it "メールが空では登録できない" do
      user = build(:user, email: "")
      user.valid?
     expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードが空では登録できない" do
      user = build(:user, password: "")
      user.valid?
     expect(user.errors[:password]).to include("を入力してください")
    end
  end
end