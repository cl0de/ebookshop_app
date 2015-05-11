Author.create!(first_name:  "Brandon",
              last_name: "Pitt")

50.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Author.create!(first_name:  first_name,
                last_name: last_name)

end

User.create!(email: "test@example.com",
            password:              "foobar12",
            password_confirmation: "foobar12")

2.times do |n|
  email = "test-#{n+1}@example.com"
  password = "password"
  User.create!(email: email,
              password:              password,
              password_confirmation: password)
end



# 4.times do |n|

# 	     title= Faker::Commerce.product_name
# 	     isbn= Faker::Code.isbn
# 	     description= Faker::Lorem.sentence(2)
# 	     price= Faker::Commerce.price
# 	     authors= Faker::Name.name

# Book.create!(title: title,
# 	     isbn: isbn,
# 	     description: description,
# 	     price: price,
# 	     authors: authors)
# end