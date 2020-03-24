FactoryBot.define do
  factory :product do
    status               {"目立った傷や汚れなし"}
    name                 {"商品名"}
    explanation          {"商品の説明"} 
    brand                {"ブランド"} 
    price                {"2000"}
    shipping_date        {"２〜３日で発送"} 
    place                {"宮城県"}
    category_id          {"1"}

    association :category

    after(:build) do |product|                          
      product.images << build(:image, product: product)
    end  

  end
end
