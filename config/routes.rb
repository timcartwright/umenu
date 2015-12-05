Rails.application.routes.draw do

  resources :order_items
  resources :orders
  resources :restaurants do
    # resources :menu_categories do
      resources :menu_items
    # end
  end
  
  devise_for :users
  root 'restaurants#index'

end