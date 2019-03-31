Rails.application.routes.draw do
  resources :products, only: [:index]
  resources :quotations, only: [:create]
end
