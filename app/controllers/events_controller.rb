class EventsController < ApplicationController
  include EventsHelper
  include UsersHelper

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    if session[:current_user]
      @event = Event.new
    else
      redirect_to sign_in_path
    end
  end

  def edit
  end

  def create
    user = User.find(session[:current_user]['id'])
    @event = user.events.build(event_params)

    if @event.save
      puts 'aaa'
    else
      render :new
    end
  end

  
end
