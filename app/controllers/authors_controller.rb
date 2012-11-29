class AuthorsController < ApplicationController
  def index
    @authors = Author.includes(:events).order('created_at DESC')
    @author = Author.new
  end


  def create
    name = params[:author][:name]
    new_author = Author.import name
    if new_author
      redirect_to  root_path
    else
      redirect_to  root_path ,notice: 'user not exist'
    end

  end
end
