Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
   
     scope '(:locale)', locale: /en||ua/ do
       devise_for :users, skip: :omniauth_callbacks
     end
       devise_for :users, skip: :omniauth_callbacks
     end

  root 'home_page#home'

  get 'cabinet/personal', to: 'cabinet#personal'
  get 'cabinet/password', to: 'cabinet#password'
  get 'cabinet/surveys', to: 'cabinet#surveys'
  get 'cabinet/teamhub', to: 'cabinet#teamhub'
  put 'cabinet/personal', to: 'cabinet#update'
  put 'cabinet/password', to: 'cabinet#change'
end
