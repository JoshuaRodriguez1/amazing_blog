FactoryBot.define do
  factory :comment do
    content { Faker::Quote.matz }
    user
    article
  end
end
