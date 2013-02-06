FactoryGirl.define do
  factory :user do
    email "testspec@gmail.com"
    password "password"
    password_confirmation "password"
  end

  factory :post do
    title "Deploying through sshii"
    body "This is post about sshii"
  end
end
