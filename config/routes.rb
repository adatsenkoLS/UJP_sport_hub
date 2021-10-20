Rails.application.routes.draw do
  devise_for :user, path: 'auth', only: :omniauth_callbacks,
                    controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                   registrations: 'user/registrations', sessions: 'user/sessions' }

  scope '(:locale)', locale: /en||ua/ do
    devise_for :user, path: 'auth', skip: :omniauth_callbacks, controllers:
    { registrations: 'user/registrations',
      sessions: 'user/sessions',
      passwords: 'user/passwords' }
  end

  # scope '(:role)', role: /admin/ do
  #  resources :atricles
  # end
  # scope '(:locale)', locale: /en||ua/ do
  namespace :users do
    resources :articles
  end

  # end
  root 'home_page#home'
end
