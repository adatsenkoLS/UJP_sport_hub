Rails.application.routes.draw do
  devise_for :sessions ,:controllers => { :sessions => 'sessions/sessions' }
 

  root 'home_page#home'
end
