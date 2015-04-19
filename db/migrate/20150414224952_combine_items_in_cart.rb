class CombineItemsInCart < ActiveRecord::Migration
  def up
  	Cart.all.each do |cart|
  		sums = cart.cart_items.group(:book_id).sum(:quantity)

  		sums.each do |book_id, quantity| 
  			if quantity > 1
  				cart.cart_items.where(book_id: book_id).delete_all
  				item = cart.cart_items.build(book_id: book_id)
  				item.quantity = quantity
  				item.save!
  			end
  		end
  	end
  end

  def down 
  	CartItem.where("quantity>1").each do |cart_item|
  		cart_item.quantity.times do
  			CartItem.create cart_id: cart_item.cart_id,
	  		book_id: cart_item.book_id, quantity: 1
	  	end

	  	cart_item.destroy
	   end
  end
end
