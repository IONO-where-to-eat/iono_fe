Rails.application.routes.draw do
  root 'landing#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :results, only: [:index]
  get '/results/shuffle', to: 'results#shuffle'
  resources :dashboard, only: [:show]
end
