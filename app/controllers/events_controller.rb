class EventsController < ApplicationController
  include EventsHelper
  include UsersHelper

  def index
    @previous_events = Event.previous_events
    @upcoming_events = Event.upcoming_events
  end

  def show
    @event = Event.find(params[:id])
    @is_previous_event = Event.previous_events.include? @event
  end

  def new
    if session[:current_user]
      @event = Event.new
    else
      redirect_to sign_in_path
    end
  end

  def create
    user = User.find(session[:current_user]['id'])
    @event = user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def add_attendee
    event = Event.find(params[:id])
    user = User.find(session[:current_user]['id'])
    event.attendees << user unless event.attendees.include? user
    redirect_to event_path(params[:id])
  end
end
