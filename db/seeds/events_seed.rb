10.times do
  event = Event.new(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    date: Faker::Date.between(from: 1.month.ago, to: 1.month.from_now),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short),
    duration: Faker::Number.between(from: 30, to: 240),
    status: 0,
    visibility: 1,
    location: Faker::Address.full_address,
    type: Type.find_by(name: 'Sales Developer')
  )

  event.cover_picture.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'authentication', 'login-poster.png')),
    filename: 'login-poster.png',
    content_type: 'image/png'
  )

  event.save
end
