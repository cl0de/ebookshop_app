class CartItemsController < ApplicationController
  
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  
  def index
    #@cart_items = CartItem.all
  end
  def show
    
  end
  def new
    #@cart_item = CartItem.new
  end
  def edit
  end
  def create
    @book = Book.find(params[:book_id])
    @cart_item = @cart.add_book(@book.id)
      session[:counter] = 0
      if @cart_item.save
        redirect_to @cart_item.cart 
      else
       render action: 'new' 
      end
  end
  def update
      if @cart_item.update(cart_item_params)
        redirect_to @cart_item, notice: 'Cart was successfully updated.' 
       
      else
         render action: 'edit' 
      end
  end
  def destroy
    @cart_item.destroy
    
     redirect_to cart_items_url,
        notice: 'Your cart is currently empty' 
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    
    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
       params.require(:cart_item).permit(:book_id)
    end
  
end
