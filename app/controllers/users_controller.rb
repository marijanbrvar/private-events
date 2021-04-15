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
      redirect_to @user
    else
      render :new
    end
  end

  def show
    if session[:current_user]
      @user = User.find(params[:id])
    else
      redirect_to sign_in_path
    end
  end

  def new_sign_in
    @user = User.find_by(name: params[:name])
    if @user
      current_user(@user.id)
      redirect_to root_path
    else
      redirect_to sign_in_path, notice: 'Please Sign In'
    end
  end

  def sign_in
    redirect_to events_path if session[:current_user]
  end

  def sign_out
    reset_session
    redirect_to sign_in_path
  end
end
