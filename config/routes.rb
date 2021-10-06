Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope '/(:locale)', locale: /en||ua/ do
    devise_for :users, skip: :omniauth_callbacks
  end

  root 'home_page#home'
end
