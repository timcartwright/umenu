Rails.application.routes.draw do

  devise_for :users
  resources :order_items
  resources :orders
  resources :charges
  
  resources :restaurants do
    # resources :menu_categories do
      resources :menu_items
    # end
  end
  
  root 'restaurants#index'

end