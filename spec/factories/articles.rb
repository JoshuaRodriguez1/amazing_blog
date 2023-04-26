FactoryBot.define do
  factory :article do
    user
    title { Faker::Book.title }
    content { Faker::Quote.matz }
    state { "draft" }
  end
end
