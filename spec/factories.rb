FactoryGirl.define do
  factory :user do
    email "testspec@gmail.com"
    password "password"
    password_confirmation "password"
  end
end
