class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    

  def facebook
       

      @user = User.create_from_provider_data(request.env['omniauth.auth'])

      Rails.logger.debug("My object: #{request.env['omniauth.auth']}")
      if @user.persisted?
        sign_in_and_redirect @user
      else
        redirect_to new_user_registration_url
      end       
  end
           
        def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
          if @user.persisted?
            sign_in_and_redirect @user
          else
            redirect_to new_user_registration_url
          end
        end
      
        def failure
         
         redirect_to new_user_registration_url
        end
  end