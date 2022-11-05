Rails.application.routes.draw do
  root 'landing#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :results, only: [:index] do
    get '/shuffle', to: 'results#shuffle'
  end
  resources :dashboard, only: [:show]
end
