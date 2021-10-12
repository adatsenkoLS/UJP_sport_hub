class CabinetController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update]

    def personal
    end

    def update
        @user = User.find(params[:id])
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.email = params[:email]

        redirect_back(fallback_location: root_path)
    end

    def password
    end

    def change
        current_user = User.new
        #params[:old_password] == current_user.encrypted_password and 
        if (params[:password] == params[:password_confirmation])
            current_user.encrypted_password = params[:password]
            redirect_back(fallback_location: root_path)
        end
    end

    def surveys
    end

    def teamhub
    end

    def edit
        @user = User.find(params[:id])
    end


    private

    def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end
end
