FactoryBot.define do
  factory :user do
    email { 'john@gmail.com' }
    password { 'Password1!' }
    role { 0 }
    username { 'JohnDoe' }
    first_name { 'John' }
    last_name { 'Doe' }
    avatar { nil }
  end
end
