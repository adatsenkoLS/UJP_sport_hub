Rails.application.routes.draw do
  devise_for :sessions
  devise_for :users

  root 'home_page#home'
end
