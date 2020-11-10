FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    password { "password" }
    password_digest { "password" }
  end
end