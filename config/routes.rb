Rails.application.routes.draw do

  resources :claims_tats
  get 'claims/index'
  get 'claims/index2'
  get 'claims/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'claims#index'
end
