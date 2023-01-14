FactoryBot.define do
  factory :user do
    name { Faker::Movies::BackToTheFuture.character}
    email { Faker::Internet.email }
    api_key { Faker::Alphanumeric.alpha(number: 10) }
  end
end
