users = [
  {
    email: "user@example.com",
    password: "123456",
    full_name: "John Doe",
    confirmed_at: 1.hour.ago
  },
  {
    email: "author@example.com",
    password: "123456",
    full_name: "Marco Polo",
    confirmed_at: 1.hour.ago
  }
]

users.each do |attrs|
  user = User.find_or_initialize_by(email: attrs[:email])
  user.attributes = attrs
  user.save!
end