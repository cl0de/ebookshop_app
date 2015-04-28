class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
 
  def index
    @carts = Cart.all
  end
  def show
   #@cart = Cart.find(cart_id)
  end
  def new
    @cart = Cart.new
  end
  def edit
  end
  def create
    @cart = Cart.new(cart_params)
      if @cart.save
        redirect_to @cart, notice: 'Cart was successfully created.' 
      else
       render action: 'new' 
      end
  end
  def update
      if @cart.update(cart_params)
        redirect_to @cart, notice: 'Cart was successfully updated.' 
       
      else
         render action: 'edit' 
      end
  end
  def destroy
    @cart.destroy
    session[:cart_id] = nil
     redirect_to root_url, notice: 'Your cart is currently empty' 
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "Hey, that wasn't a cart"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end
 
 
end