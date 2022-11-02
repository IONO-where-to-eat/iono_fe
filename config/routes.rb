Rails.application.routes.draw do
  root 'landing#index'
  resources :results, only: [:index]
end
