class CabinetController < ApplicationController
    before_action :authenticate_user!

    def personal
    end

    def update
        @user = current_user
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.email = params[:email]
        @user.save
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
        @user = current_user
        @user.encrypted_password = params[:new_password]
        @user.save
        redirect_back(fallback_location: root_path)
    end
end
