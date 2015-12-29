FactoryGirl.define do

  factory :user do
    username { Faker::Internet.user_name  }
    password 'password'
    email {  Faker::Internet.email }
  end

  factory :category do
    name { Faker::Commerce.product_name }
  end

  factory :topic do
    name { Faker::Commerce.product_name }
    association :category
  end

  factory :conversation do
    name { Faker::Commerce.product_name }
    association :topic
  end


end