class AuthorsController < ApplicationController
  def index
    @authors = Author.includes(:events).order
    @author = Author.new
  end


  def create
    name = params[:author][:name]
    new_author = Author.import name
    if new_author
      redirect_to  'index'
    else
      redirect_to  'index' ,notice: 'user not exist'
    end

  end
end
