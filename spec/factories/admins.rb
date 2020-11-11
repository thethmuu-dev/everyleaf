FactoryBot.define do
  factory :admin do
    name { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    password { "password" }
    password_digest { "password" }
    is_admin { true }
  end
end