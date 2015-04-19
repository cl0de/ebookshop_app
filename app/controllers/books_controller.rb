class BooksController < ApplicationController
 before_action :set_book, only: [:show, :edit, :update, :destroy]
  
  def index
    @books = Book.paginate(:page => params[:page], per_page:  4)
  end
  
  def show
    @book = Book.find(params[:id])
  
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    
    if @book.save
      flash[:success] = "New Book created successfully."
      redirect_to(:action => 'index')
    else
     # load_data
    render 'new'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
   def update
    @book = Book.find(params[:id])
    
    if @book.update_attributes(book_params)
      flash[:success] = "Book updated successfully."
      redirect_to @book
    else
    
    render'edit'
    end
   end
  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted"
    redirect_to books_url
  end
  
private
  def set_book
      @book = Book.find(params[:id])
  end
  def book_params
      params.require(:book).permit(:title, :isbn, :description, :price, :authors, :picture)
  end

end
