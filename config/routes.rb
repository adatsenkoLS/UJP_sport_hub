Rails.application.routes.draw do
  get 'admin/teams/:team_id', to: 'user_teams#create_team_and_user', as: 'create_user_team', defaults: { format: 'js' }

  get 'category/:category_id/getsubcategory', to: 'categories#get_sub_by_category', as: 'get_sub_by_category'

  devise_for :user, path: 'auth', only: :omniauth_callbacks,
                    controllers: {
                      registrations: 'user/registrations', sessions: 'user/sessions', omniauth_callbacks: 'user/omniauth_callbacks'
                    }

  scope '(:locale)', locale: /en||ua/ do
    devise_for :user, path: 'auth', skip: :omniauth_callbacks, controllers:
    { registrations: 'user/registrations',
      sessions: 'user/sessions',
      passwords: 'user/passwords',
      omniauth_callbacks: 'user/omniauth_callbacks' }
  end

  post '/auth/auth/facebook' => 'user/omniauth_callbacks#facebook'

  # scope '(:role)', role: /admin/ do
  #  resources :atricles
  # end
  scope '(:locale)', locale: /en||ua/ do
    namespace :users do
      resources :articles do
        member do
          patch 'change_status'
        end
      end
      resources :teams, :user_team, :category
    end
    resources :articles

    resources :cities
  end

  delete '/users/teams/:id', to: 'users/teams#destroy',as: 'delete_path'
  get 'news_partners', to: "news_partners#show"
  get 'news_partners/new', to: "news_partners#new"
  get 'news_partners/edit/:id', to: "news_partners#edit"
  get 'news_partners/delete/:id', to: "news_partners#delete"
  post 'news_partners/delete', to: "news_partners#destroy"
  post 'news_partners', to: "news_partners#create"
  patch 'news_partners', to: "news_partners#change_status"
  put 'news_partners/edit/:id', to: "news_partners#update"

  

  root 'home_page#home'
  namespace :users do
    get 'cabinet/personal', to: 'cabinet#personal'
    get 'cabinet/password', to: 'cabinet#password'
    get 'cabinet/surveys', to:  'cabinet#surveys'
    put 'cabinet/personal', to: 'cabinet#update'
    put 'cabinet/password', to: 'cabinet#change'
    get 'cabinet/followed_team', to: 'cabinet#followed_team' ,as: "followed_team"
    get 'cabinet/all_teams', to: 'cabinet#all_teams'
    get 'cabinet/search_team',to: "cabinet#search_team", as: "search_team"
    
    post 'cabinet/follow_team',to: "cabinet#follow_team", as: "follow_team"
    delete 'cabinet/unfollow_team/:id',to: "cabinet#unfollow_team", as: "unfollow_team"
  end
  


end
