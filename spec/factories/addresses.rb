FactoryBot.define do
  factory :address do
    shipping_name_last_name     {""}
    shipping_name_first_name    {""}
    shipping_last_name_kana     {""} 
    shipping_first_name_kana    {""} 
    postcode                    {""}
    state                       {""} 
    city                        {""}
    address_line                {""}
  end
end
