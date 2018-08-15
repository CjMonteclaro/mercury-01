Rails.application.routes.draw do
  resources :charge_rates
  resources :charge_types
<<<<<<< HEAD
  resources :premiums
  resources :perils
  resources :sublines
  resources :lines
=======
  resources :perils
  resources :sublines
  resources :lines
  resources :premiums do
  collection do
    post :import
  end
end
>>>>>>> cj
  get 'claims/index'

  get 'claims/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'claims#index'
end
