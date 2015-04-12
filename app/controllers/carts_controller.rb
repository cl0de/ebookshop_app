class CartsController < ApplicationController

  def show
    @cart_items = current_cart.cart_items
  end
  def add
    @book = Book.find(params[:id])
    if request.post?
      @item = @cart.create(params[:id])
     flash[:success] = "Added <em>#{@item.book.title}</em>"
     redirect_to :controller => "books"
    else
     render
    end
  end
  

  #def update
  #  @cart = current_cart
  #  @cart_item = @cart.cart_items.find(params[:id])
  #  @cart_item.update_attributes(cart_item_params)
  #  @cart_items = @cart.cart_items
 # end

 # def destroy
  #  @cart = current_cart
  #  @cart_item = @cart.cart_items.find(params[:id])
 #   @cart_item.destroy
 #   @cart_items = @cart.cart_items
 # end

end
