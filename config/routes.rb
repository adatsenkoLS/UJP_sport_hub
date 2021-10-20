Rails.application.routes.draw do
  
  get 'cabinet/teamhub/:team_id', to: 'user_teams#create_team_and_user', as: 'create_user_team'
  resources :teams
  resource :user_team
  
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

  get 'cabinet/personal', to: 'cabinet#personal'
  get 'cabinet/password', to: 'cabinet#password'
  get 'cabinet/surveys', to:  'cabinet#surveys'
  put 'cabinet/personal', to: 'cabinet#update'
  put 'cabinet/password', to: 'cabinet#change'
end
