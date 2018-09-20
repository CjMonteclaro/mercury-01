Rails.application.routes.draw do
  devise_for :users
  resources :models
  resources :brands
  resources :profiles
  resources :policies
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

  resources :vehicles do
    collection { post :import }
  end

  resources :premiums do
    collection { post :import }
  end

  get 'claims/index'

  get 'claims/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'quotes#index'
end
