# Ruby on Rails:  eBookShop App

-----------------------------------

This is an online book shop application developed using Ruby on Rails framework as part of a university course work.

It allows a user to view a list of books and their authors, to read more about the shop and be able to get help. 

The layout is set using Foundation 5.

A user can create an account and an email verification is sent to the user's email box. 
Once verified, a user can now log, navigate the shop and log out. 
User authentication and admin role are set using Devise gem.

Both logged in user and non-logged in user can view details of the book and choose to put it in shopping cart provided.
A user can any number of books add in the cart and also has the option to clear the cart.
A checkout system is provided using PayPal payment system. This is sandbox paypal for simulating the 
real payment system for developer. 
After processing payment over paypal, a user is returned to the shop website.

This application contains five models with distinct associations defining their common operations:
	Author has and belongs to many Books
	Book has and belongs to many Authors, has many CartItems
	Cart has many CartItems
	CartItem  belongs to Book, belongs to Cart
	User

At the begining, It used Sqlite 3 database for development environment which changed to PostgresSQL
for both development and production as recommended by Heroku for a smooth deployment. 
A new database configuration for postgres database was done.

Seeds data are given for populating application.

S3 Amazon storage is used for storing big data like images.

This application is hosted on git@bitbucket.org as cl0de/eBookShop_app.git 
and is deployed on Heroku at https://git.heroku.com/ as [glacial-river-5618.herokuapp.com]
 
-------------------------- 

This is the ecommerce application for the [*DPW-Assignment: Leeds Beckett University*](http://www.leedsbeckett.ac.uk/)
by [c3441815]