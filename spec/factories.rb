FactoryGirl.define do
  factory :user do
    email "testspec@gmail.com"
    password "password"
    password_confirmation "password"
  end

  factory :post do
    title "Deploying through ssh"
    body "This is post about ssh"
    published 1
    user_id 1
    published_at "2013-02-07 04:40:58"
  end

  factory :page do
    title "My new page"
    content "This is page"
    published 1
    published_at "2013-02-07 04:40:58"
  end

  factory :comment do
    name "testspec"
    email "testspec@gmail.com"
    content "my wow comment"
    post_id 1
  end
end
