Rails.application.routes.draw do
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :products
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/index'
  get 'static_pages/landing_page'
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
