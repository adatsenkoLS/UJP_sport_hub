Rails.application.routes.draw do
  devise_for :user,path:'auth', only: :omniauth_callbacks, 
  controllers: { 
  :registrations => 'user/registrations', :sessions => 'user/sessions',  omniauth_callbacks: 'user/omniauth_callbacks' }

  scope '(:locale)', locale: /en||ua/ do
    devise_for :user,path:'auth', skip: :omniauth_callbacks,controllers:
    { :registrations => 'user/registrations', 
      :sessions => 'user/sessions',
      :passwords => 'user/passwords',
      omniauth_callbacks: 'user/omniauth_callbacks'

    }
  end 

  post '/auth/auth/facebook' => 'user/omniauth_callbacks#facebook'

  root 'home_page#home'
end
