FactoryBot.define do
  factory :user do
    name { "thet" }
    email { "thet@gmail.com" }
    password { "thetthet" }
    password_digest { "thetthet" }
  end
end