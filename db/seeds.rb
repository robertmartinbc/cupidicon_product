require 'faker'

rand(10..30).times do
  p = Assignment.create(title: Faker::Lorem.words(rand(1..10)).join(" "), body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))
  rand(3..10).times do
    p.comments.create(body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"))
  end
end

puts "Seed finished"
puts "#{Assignment.count} posts created"
puts "#{Comment.count} comments created"
