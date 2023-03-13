FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    password { Faker::Internet.password }
    email { Faker::Internet.safe_email }
  end
end
