Rails.application.routes.draw do
  post 'open' => 'door#open'

  root to: 'pages#index'
  get '/pages/new', to: 'pages#new'
  post '/pages/create', to: 'pages#create'
  get '/:uid', to: 'pages#index', as: :pages

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
