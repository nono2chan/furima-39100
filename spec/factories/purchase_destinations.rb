FactoryBot.define do
  factory :purchase_destination do
    association :user
    association :item
    card_number { '4242424242424242' }
    card_exp_month { 8 }
    card_exp_year { 27 }
    card_cvc { '123' }
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number { '09012345678' }

  end
end
