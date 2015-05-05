class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
 
  def add_book(book_id)
		current_item = cart_items.find_by(book_id: book_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = cart_items.build(book_id: book_id)
		end
		  current_item
  end

	def total_price
		cart_items.to_a.sum { |item| item.total_price }
	end
	def paypal_url(return_url)
   values = {
        business: "uwaclode-facilitator@gmail.com",
        cmd: '_cart',
        upload: 1,
        return: return_url,
        invoice: id
        
        
    }
     cart_items.each_with_index do |item, index|
        	values.merge!({
        		"amount_#{index+1}" => item.total_price,
        		"item_name_#{index+1}" => item.book.title,
        		"item_number_#{index+1}" => item.book.isbn,
        		"quantity_#{index+1}" => item.quantity
        		})
        end	
    "https://www.sandbox.paypal.com/uk/cgi-bin/webscr?" + values.to_query
	end

  
end
