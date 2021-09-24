Rails.application.routes.draw do
  devise_for :users

  root 'home_page#home'
  # resources :users
end
