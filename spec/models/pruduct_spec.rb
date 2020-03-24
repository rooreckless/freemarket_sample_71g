require 'rails_helper'
describe Product do
  describe '#create' do
    it "商品名が空では登録できない" do
      product = build(:product, name: "")
      product.valid?
     expect(product.errors[:name]).to include("を入力してください")
    end
  end
end