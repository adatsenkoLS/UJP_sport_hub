Rails.application.routes.draw do
  
  devise_for :users ,path:'auth',:controllers => { :sessions => 'users/sessions',
      :passwords => 'users/passwords'},
   path_names:
   {
    sign_in: 'login'
   } 
  
  root 'home_page#home'
end 