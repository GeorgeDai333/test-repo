# db/seeds.rb

require 'faker'

puts "Seeding books..."

# Optional clean start
# Book.destroy_all   # ← comment out if you don't want to delete existing books

20.times do
  Book.create!(
    title:        Faker::Book.title,
    author:       Faker::Book.author,
    price:        rand(4.99..29.99).round(2),
    published_at: Faker::Time.between(from: 80.years.ago, to: 1.year.ago)
  )
end

puts "Created #{Book.count} books."