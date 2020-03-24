FactoryBot.define do
  factory :product do
    status               {"目立った傷や汚れなし"}
    name                 {"商品名"}
    explanation          {"商品の説明"} 
    brand                {"ブランド"} 
    price                {"2000"}
    shipping_date        {"２〜３日で発送"} 
    place                {"宮城県"}
    created_at           {"2020-03-23 11:53:44"}
    updated_at           {"020-03-23 11:53:44"}
    category_id          {"5"}
  end
end
