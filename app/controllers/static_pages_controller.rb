class StaticPagesController < ApplicationController
  def home
    @books = Book.order(:title)
  	@count = counter
  	@books = Book.paginate(page: params[:page], per_page:  6)
  	
  end

  def about
  
  end

  def contact
  end

  def help
  end
  
  def reset_counter
  	@count = session[:session] = 0 
  end

  def counter
  	# if session[:counter].nil? session[:counter] = 0 : session[:counter] += 1
  	if session[:counter].nil?
  		session[:counter] = 0
  	else
  		session[:counter] += 1
  	end
  end
end
