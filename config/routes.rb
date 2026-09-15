Rails.application.routes.draw do
  root "bosses#index"
  resources :bosses, only: [:index]
  resources :logs, only: [:new, :create]
end
