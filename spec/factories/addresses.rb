FactoryBot.define do
  factory :address do
    shipping_name_last_name     {"直王道"}
    shipping_name_first_name    {"丸山"}
    shipping_last_name_kana     {"ナオミチ"} 
    shipping_first_name_kana    {"マルヤマ"} 
    postcode                    {"150-0043"}
    state                       {"東京都"} 
    city                        {"渋谷区"}
    address_line                {"道玄坂2丁目"}
  end
end
