require 'rails_helper'
describe Product do
  describe '#create' do
    it "商品名が空では登録できない" do
      product = build(:product, name: "")
      product.valid?
     expect(product.errors[:name]).to include("を入力してください")
    end

    it "商品の状態が空では登録できない" do
      product = build(:product, status: "")
      product.valid?
     expect(product.errors[:status]).to include("を入力してください")
    end

    it "商品の説明が空では登録できない" do
      product = build(:product, explanation: "")
      product.valid?
     expect(product.errors[:explanation]).to include("を入力してください")
    end

    it "商品のブランドが空では登録できない" do
      product = build(:product, brand: "")
      product.valid?
     expect(product.errors[:brand]).to include("を入力してください")
    end

    it "商品の値段が空では登録できない" do
      product = build(:product, price: "")
      product.valid?
     expect(product.errors[:price]).to include("を入力してください")
    end

    it "商品の値段が空では登録できない" do
      product = build(:product, shipping_date: "")
      product.valid?
     expect(product.errors[:shipping_date]).to include("を入力してください")
    end

    it "商品の発送元が空では登録できない" do
      product = build(:product, place: "")
      product.valid?
     expect(product.errors[:place]).to include("を入力してください")
    end

    it "商品に紐ずくカテゴリが空では登録できない" do
      product = build(:product, category_id: "")
      product.valid?
     expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "全ての必須項目が入力されている場合出品できる" do
      product = FactoryBot.build(:product)
      expect(product).to be_valid
    end
  end
end