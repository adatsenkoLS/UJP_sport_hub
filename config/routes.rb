Rails.application.routes.draw do
  devise_for :sessions ,path:'auth',:controllers => { :sessions => 'sessions/sessions'}, path_names:{
    sign_in: 'login'
  }
  
  

  root 'home_page#home'
end
