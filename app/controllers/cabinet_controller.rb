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
        @user = current_user
        @user.password = params[:password]
        @user.save
        redirect_back(fallback_location: root_path)
    end

    def surveys
    end

    def teamhub
    end
end
