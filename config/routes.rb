Rails.application.routes.draw do
  resources :perils
  resources :sublines
  resources :lines
  get 'claims/index'

  get 'claims/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'claims#index'
end
