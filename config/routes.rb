Rails.application.routes.draw do
  root "events#index"
  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#new_sign_in'
  get '/sign_out', to: 'users#sign_out'
  get 'events/:id/attend', to: 'events#add_attendee', as: 'attend'
  resources :events, only: [:index, :new, :create, :show, :add_attendee]
  resources :users, only: [:new, :create, :show]
end