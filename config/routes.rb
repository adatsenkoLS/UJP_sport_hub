Rails.application.routes.draw do
  
  resources :comments
  get 'cabinet/teamhub/:team_id', to: 'user_teams#create_team_and_user', as: 'create_user_team'
  resources :teams
  resource :user_team
  
  devise_for :user,path:'auth', only: :omniauth_callbacks, 
  controllers: { 
  :registrations => 'user/registrations', :sessions => 'user/sessions',  omniauth_callbacks: 'user/omniauth_callbacks' }

  get 'category/:category_id/getsubcategory', to: 'categories#get_sub_by_category', as: 'get_sub_by_category'

  devise_for :user, path: 'auth', only: :omniauth_callbacks,
                    controllers: {
                      registrations: 'user/registrations', sessions: 'user/sessions', omniauth_callbacks: 'user/omniauth_callbacks'
                    }

  devise_for :user, path: 'auth', only: :omniauth_callbacks,
                    controllers: {
                      registrations: 'user/registrations', sessions: 'user/sessions', omniauth_callbacks: 'user/omniauth_callbacks'
                    }

    }
  end

  post '/auth/auth/facebook' => 'user/omniauth_callbacks#facebook'

  # scope '(:role)', role: /admin/ do
  #  resources :atricles
  # end
  # scope '(:locale)', locale: /en||ua/ do
  namespace :users do
    resources :articles do
      resources :comments
    end
  end

  resources :cities

  # end
  root 'home_page#home'

  get 'cabinet/personal', to: 'cabinet#personal'
  get 'cabinet/password', to: 'cabinet#password'
  get 'cabinet/surveys', to:  'cabinet#surveys'
  put 'cabinet/personal', to: 'cabinet#update'
  put 'cabinet/password', to: 'cabinet#change'
end
