class CabinetController < ApplicationController
    before_action :authenticate_user!

    def personal
    end

    def update
        @user = current_user
        @user.update(avatar: params[:avatar]) if params[:avatar] 
        @user.update(first_name: params[:first_name], 
            last_name: params[:last_name], email: params[:email])
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

    def followed_team
    end

    private

    def cabinet_params
        params.require(:put).permit(:first_name, :last_name, :email, :avatar)
    end
end
