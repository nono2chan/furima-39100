FactoryBot.define do
  factory :item do
    association :user
    image  { '20200415_kouzu-photo_13-670x443.jpeg'}
    name   { Faker::Name.initials(number: 2) }
    price  { '1000' }
    text   { '美品' }
    user_id { @user }
    genre_id { 1 }
    quality_id { 1 }
    payment_id { 1 }
    prefecture_id { 1 }
    days_id { 1 }

  end
end
