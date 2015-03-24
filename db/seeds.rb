Author.create!(first_name:  "Brandon",
               last_name: "Pitt")

50.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Author.create!(first_name:  first_name,
                 last_name: last_name)

end
