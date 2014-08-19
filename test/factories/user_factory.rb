FactoryGirl.define do
  factory :user, class: User do
    email    { Faker::Internet.email }
    password { Faker::Number.digit * 8 }
  end
end

