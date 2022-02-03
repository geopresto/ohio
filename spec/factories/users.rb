FactoryBot.define do
  
  factory :user do
    name { "David" }
    email { "David@gmail.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
