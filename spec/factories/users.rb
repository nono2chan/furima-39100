FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'g9' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           {'山田'}
    first_name            {'孝之'}
    family_name_kana      {'ヤマダ'}
    first_name_kana       {'タカユキ'}
    birth_day             { Faker::Date.birthday }
  end
end