FactoryBot.define do
  factory :user do
    email { Faker::Omniauth.google[:info][:email] }
    token { Faker::Omniauth.google[:credentials][:token] }
    google_id { Faker::Omniauth.google[:uid] }
  end
end
