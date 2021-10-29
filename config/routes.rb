Rails.application.routes.draw do
  devise_for :users
  get '/auth/google_oauth2/callback', to: 'sign#index'
  get '/auth/facebook/callback', to: 'sign#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
