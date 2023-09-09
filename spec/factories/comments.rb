FactoryBot.define do
  factory :comment do
    user { nil }
    content { "MyString" }
    parent_id { 1 }
    event { nil }
  end
end
