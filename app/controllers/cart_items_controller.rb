class CartItemsController < ApplicationController
  
  include current_cart
  before_action :set_cart, only: [:create]
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  
  
  
  def create
  	book = Book.find(params[:book_id])
  	@cart_item = @cart.cart_items.build(book: book)

	  if @cart_item.save
	    redirect_to @cart_item.cart, notice:'Line item was successfully created.'


    else
	    render action: 'new'

	  end
  end

end
