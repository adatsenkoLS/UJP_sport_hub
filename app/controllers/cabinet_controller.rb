class CabinetController < ApplicationController
    #before_action :authenticate_user!

    def personal
    end

    def update
        current_user = User.new
        current_user.first_name = params[:first_name]
        current_user.last_name = params[:last_name]
        current_user.email = params[:email]

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
end
