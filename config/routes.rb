Rails.application.routes.draw do

  devise_for :users

  resources :order_items
  
  resources :charges

  
  resources :restaurants do
    # resources :menu_categories do
    resources :menu_items
    resources :menu_categories
    resources :orders
    # end
  end
  
  
  root 'restaurants#index'

end