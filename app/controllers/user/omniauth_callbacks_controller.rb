class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    

  def facebook
    
    

      @user = User.create_from_provider_data(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user
      else
        Rails.logger.debug("My object HELOLOHELOHLOELOHELOHLOEOLHOLEOHLHOLHLOEOLHEOLHOLOLHEOLHEOLEOHLOHEOLHEOLHEL")
        redirect_to new_user_registration_url
      end       
  end
           
        def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
          if @user.persisted?
            new_user_session_path @user
          else
            Rails.logger.debug("My object HELOLOHELOHLOELOHELOHLOEOLHOLEOHLHOLHLOEOLHEOLHOLOLHEOLHEOLEOHLOHEOLHEOLHEL")
            redirect_to new_user_registration_url
          end
        end
      
        def failure
         
         redirect_to new_user_registration_url
        end
  end