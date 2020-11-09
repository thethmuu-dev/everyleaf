FactoryBot.define do
  factory :admin do
    name { "hmuu" }
    email { "hmuu@gmail.com" }
    password { "hmuuhmuu" }
    password_digest { "hmuuhmuu" }
    is_admin { ture }
  end
end