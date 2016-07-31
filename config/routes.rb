Rails.application.routes.draw do
  post 'open' => 'door#open'

  root to: 'pages#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
