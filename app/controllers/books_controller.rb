class BooksController < ApplicationController
  #before_action :authenticate_user!
  
  def index
    #@books = Book.paginate(:page => params[:page], :per_page => 4)
    
    @books = Book.all
   # @cart_items = current_cart.cart_items.new
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    #load_data
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    
    if @book.save
      flash[:success] = "New Book added successfully."
      redirect_to(:action => 'index')
    else
     # load_data
    render('new')
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
   def update
    @book = Book.find(params[:id])
    
    if @book.update_attributes(book_params)
      flash[:success] = "New Book added successfully."
      
redirect_to @book
    else
     # load_data
    render'edit'
    end
   end
  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted"
    redirect_to books_url
  end
  
private
  def book_params
      params.require(:book).permit(:title, :isbn, :description, :price, :authors, :picture)
  end
  #def load_data
  # @authors = Author.all
 # end
  
end
