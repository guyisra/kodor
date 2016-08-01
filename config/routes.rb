Rails.application.routes.draw do
  post 'open' => 'door#open'

  root to: 'pages#index'
  get '/pages/new', to: 'pages#new'
  get '/users', to: 'users#index'
  delete '/users/delete', to: 'users#delete'
  post '/users/create', to: 'users#create'
  get '/:uid', to: 'pages#index', as: :pages

  post 'open_again', to: 'pages#open_again'
  get '/auth/:provider/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
