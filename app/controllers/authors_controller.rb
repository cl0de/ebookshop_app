class AuthorsController < ApplicationController
  
  def index
    @authors = Author.paginate(page: params[:page])
  end
  def show
    @author = Author.find(params[:id])
  end
  def new
    @author = Author.new
  end
  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "New author created successfully."
      redirect_to(:action => 'index')
    else
    render('new')
    end
  end
  
  def edit
     @author = Author.find(params[:id])
  end
  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params)
      flash[:success] = "Author updated successfully."
      redirect_to @author
    else
      render'edit'
    end
  end
  def destroy
    Author.find(params[:id]).destroy
    flash[:success] = "Author deleted"
    redirect_to authors_url
  end


private

    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end

end
