FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 123_456 }
  end
end
