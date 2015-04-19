class CartItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :cart
  validates :quantity, :presence => true
  
  def total_price
  	book.price * quantity
  end
  
end
