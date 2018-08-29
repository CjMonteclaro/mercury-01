Rails.application.routes.draw do
  resources :profiles
  resources :policies
  resources :quote_vehicles
  resources :vehicles
  resources :models
  resources :brands
  resources :quotes
  resources :users
  resources :charge_rates
  resources :charge_types
  resources :premiums
  resources :perils
  resources :sublines
  resources :lines
  resources :perils
  resources :sublines
  resources :lines
  resources :premiums do
    collection { post :import }
  end
  get 'claims/index'

  get 'claims/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'quotes#index'
end
