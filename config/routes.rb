Rails.application.routes.draw do
  root "events#index"
  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#new_sign_in'
  get '/sign_out', to: 'users#sign_out'
  resources :events, only: [:index, :show]
  resources :users, only: [:new, :create, :show] do
    resources :events, only: [:new, :create]
  end
end
