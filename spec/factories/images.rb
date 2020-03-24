FactoryBot.define do

  factory :image do
    image   {File.open("#{Rails.root}/spec/fixtures/hand.jpg")}
    product
  end

end