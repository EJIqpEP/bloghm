FactoryGirl.define do
  factory :user do
    email "testspec@gmail.com"
    password "password"
    password_confirmation "password"
  end

  factory :post do
    title "Deploying through ssh"
    body "This is post about ssh"
  end
end
