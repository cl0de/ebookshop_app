class OrdersController < ApplicationController
  include CurrentCart
  
  #before_action :set_cart, only: [:create]
  
  
  def new
    @order = Order.new
    @cart = Cart.new
    #@cart.build_card
  end

  def create
    @order = Order.new(order_params)
   #@order = @cart.current_cart.build_order(order_params)
    @order.ip_address = request.remote_ip
      if @order.save
        #if @order.purchase
         # render :action => 'SUCCESS' 
       # else
        # render :action => 'FAILURE'
       # end
      else
        render :action => 'new'
      end
  end

  private
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:new, :cart_id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on)
    end
end
