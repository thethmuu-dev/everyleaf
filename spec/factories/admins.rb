FactoryBot.define do
  factory :admin, class: User do
    name { 'Admin' }
    email { 'admin@gmail.com' }
    password { "adminadmin" }
    is_admin { true }
  end
end