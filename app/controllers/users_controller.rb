class UsersController < ApplicationController
  include UsersHelper

  def new
    if session[:current_user]
      redirect_to events_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      current_user(@user.id)
    else
      render :new
    end
  end

  def show
  end

end
