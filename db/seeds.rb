require 'faker'
include Faker

Author.create!(first_name:  "Brandon",
              last_name: "Pitt")

50.times do |n|
  first_name  = Name.first_name
  last_name = Name.last_name
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


images = %w(image1.jpg image2.jpg image3.jpg image4.jpg )

#authors =%w(Brandon Pitt, Nono Sai, Maria Nozak, Fafa Ly)



6.times do|n|

book = Book.create!(:title => "#{Commerce.product_name}",
	  							 :isbn => rand(1234567890),
	  							 :description => Lorem.paragraph(2),
	  							 :price => Commerce.price,
	  							 :picture => File.open(File.join(Rails.root.to_s, 'app/assets/images/')+ images[rand(images.length)]),
	  							 #:authors => authors[rand(authors.length)]
	  							 )
	 							      
end
	  

