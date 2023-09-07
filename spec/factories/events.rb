FactoryBot.define do
  factory :event do
    title { 'MyString' }
    description { 'MyString' }
    date { '2023-09-07' }
    time { '2023-09-07 17:22:47' }
    duration { 1 }
    status { 1 }
    visibility { 1 }
    location { 'MyString' }
    type { nil }
  end
end
