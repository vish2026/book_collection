puts "Seeding for environment: #{Rails.env}"

UserBook.delete_all
User.delete_all
Book.delete_all

def seed_users(prefix)
  [
    "#{prefix}_user1",
    "#{prefix}_user2",
    "#{prefix}_user3"
  ].map { |u| User.create!(username: u) }
end

def seed_books(titles)
  titles.map { |t| Book.create!(title: t) }
end

if Rails.env.development?
  users = seed_users("dev")
  books = seed_books([
    "Dev Book 1",
    "Dev Book 2",
    "Dev Book 3",
    "Dev Book 4",
    "Dev Book 5"
  ])

elsif Rails.env.test?
  users = seed_users("test")
  books = seed_books([
    "Test Book A",
    "Test Book B",
    "Test Book C",
    "Test Book D",
    "Test Book E"
  ])

elsif Rails.env.production?
  users = seed_users("prod")
  books = seed_books([
    "Prod Book I",
    "Prod Book II",
    "Prod Book III",
    "Prod Book IV",
    "Prod Book V"
  ])
else
  users = seed_users("other")
  books = seed_books([
    "Other Book 1",
    "Other Book 2",
    "Other Book 3",
    "Other Book 4",
    "Other Book 5"
  ])
end

UserBook.create!(user: users[0], book: books[0])
UserBook.create!(user: users[1], book: books[1])
UserBook.create!(user: users[2], book: books[2])

puts "Seeded Users: #{User.count}, Books: #{Book.count}, UserBooks: #{UserBook.count}"
