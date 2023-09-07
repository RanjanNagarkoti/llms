# frozen_string_literal: true

10.times do
  Type.create do |type|
    type.name = Faker::Job.title
  end
end
