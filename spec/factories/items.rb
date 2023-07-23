FactoryBot.define do
  factory :item do
    association :user
    name   { Faker::Name.initials(number: 2) }
    price  { '1000' }
    text   { '美品' }
    user_id { @user }
    genre_id { 1 }
    quality_id { 1 }
    payment_id { 1 }
    prefecture_id { 1 }
    days_id { 1 }

    # after(:build) do |item|
    #   item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end

  end
end
