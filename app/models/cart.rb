class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :books, :through => :cart_items, dependent: :destroy
  
  attr_reader :cart_items
  
 



  #def finalize
  #  self[:unit_price] = unit_price
  #  self[:total_price] = quantity * self[:unit_price]
  #end
  #before_create :set_order_status
  #before_save :update_subtotal
  
  def subtotal
    cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.unit_price) : 0 }.sum
  end
  
# private
    def cart_items
      @cart_items
    end

    

  #def set_order_status
  #  self.order_status_id = 1
  #end

  #def update_subtotal
  #  self[:subtotal] = subtotal
 # end
end
