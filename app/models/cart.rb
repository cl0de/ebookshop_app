class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  
  def add_book(book_id)
		current_item = cart_items.find_by(book_id: book_id)
		if current_item
			current_item.quantity += 1
			#current_item.quantity = current_item.quantity.blank? ? 1 : current_item.quantity + 1
		else
			current_item = cart_items.build(book_id: book_id)
		end
		  current_item
  end

	def total_price
		cart_items.to_a.sum { |item| item.total_price }
	end
  
end
