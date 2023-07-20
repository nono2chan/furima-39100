class UsersController < ApplicationController

  def show
   @user = User.find(params[:id])
   @furima = Furima.where(user_id: params[:id]).includes(:user)
  end

  
end