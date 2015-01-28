cat_array = [ Category.create(title: "Love"),
Category.create(title: "Inspirational"),
Category.create(title: "Funny"),
Category.create(title: "Happiness"),
Category.create(title: "Friendship"),
Category.create(title: "Wisdom"),
Category.create(title: "Misc") ]

User.create(name: "b", password:"b")

user_array = []
10.times do
  user_array << User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: "password")
end

cat_array.each do |cat|
  user_array.each do |user|
    5.times do
      user.submitted_quotes << cat.quotes.create(content: Faker::Lorem.sentence, author: Faker::Lorem.word)
    end
  end
end