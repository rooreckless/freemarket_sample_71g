# require 'rails_helper'

# RSpec.describe Address, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


require 'rails_helper'
describe Address do
  describe '#create' do
    it "発送先の名前が空では登録できない" do
      address = build(:address, shipping_name_last_name: "")
      address.valid?
     expect(address.errors[:shipping_name_last_name]).to include("を入力してください")
    end

    it "発送先の名前の苗字が空では登録できない" do
      address = build(:address, shipping_name_first_name: "")
      address.valid?
     expect(address.errors[:shipping_name_first_name]).to include("を入力してください")
    end

    it "発送先の名前の振り仮名が空では登録できない" do
      address = build(:address, shipping_last_name_kana: "")
      address.valid?
     expect(address.errors[:shipping_last_name_kana]).to include("を入力してください")
    end

    it "発送先の名前の苗字の振り仮名が空では登録できない" do
      address = build(:address, shipping_first_name_kana: "")
      address.valid?
     expect(address.errors[:shipping_first_name_kana]).to include("を入力してください")
    end

    it "郵便番号が空では登録できない" do
      address = build(:address, postcode: "")
      address.valid?
     expect(address.errors[:postcode]).to include("を入力してください")
    end

    it "都道府県が空では登録できない" do
      address = build(:address, state: "")
      address.valid?
     expect(address.errors[:state]).to include("を入力してください")
    end

    it "市区町村が空では登録できない" do
      address = build(:address, city: "")
      address.valid?
     expect(address.errors[:city]).to include("を入力してください")
    end

    it "町内番地が空では登録できない" do
      address = build(:address, address_line: "")
      address.valid?
     expect(address.errors[:address_line]).to include("を入力してください")
    end
  end
end