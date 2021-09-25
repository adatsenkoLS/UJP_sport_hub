Rails.application.routes.draw do
  devise_for :users

  root 'home_page#home

  get 'cabinet/personal', to: 'cabinet#personal'
  get 'cabinet/password', to: 'cabinet#password'
  get 'cabinet/surveys', to: 'cabinet#surveys'
  get 'cabinet/teamhub', to: 'cabinet#teamhub'

end
