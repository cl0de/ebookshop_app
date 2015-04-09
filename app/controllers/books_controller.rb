class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    #load_data
    @book = Book.new
    
    #@all_authors = Author.all
    #@author_book = @book.author_books.build
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
    @book = Book.new(book_params)
    
    if @book.save
      flash[:success] = "New Book added successfully."
      redirect_to(:action => 'show', :id => @book.id)
    else
     # load_data
    render('edit')
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
