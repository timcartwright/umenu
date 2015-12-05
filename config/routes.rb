Rails.application.routes.draw do

  resources :restaurants do
    resources :menu_items
  end
  
  devise_for :users
  root 'restaurants#index'

end