class CookbooksController < ApplicationController
  def index
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.create(cookbook_params)
    @cookbook.user_id = session[:user_id]

    if @cookbook.save
        redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :description)
  end
end
