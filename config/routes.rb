Rails.application.routes.draw do

  post '/auth/login', to: 'authentication#login'
  post '/auth/signup/', to: 'api/v1/users#create'

  namespace :api do
    namespace :v1 do
      resources :cars
      resources :users, except: [:create]
      resources :reservations
    end
  end
end