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
      @created_events = current_user_now.events
      @previous_events = current_user_now.attended_events.previous_events
      @upcoming_events = current_user_now.attended_events.upcoming_events
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
    @user = User.find_by(name: params[:name])
    if @user
      @user = User.find_by(name: params[:name])
      p @user
      current_user(@user.id)
      redirect_to events_path
    else
      render :sign_in
    end
  end

  def sign_out
    reset_session
    redirect_to sign_in_path
  end
end
