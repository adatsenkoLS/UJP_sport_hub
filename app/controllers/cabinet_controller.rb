class CabinetController < ApplicationController
    before_action :authenticate_user!

    def personal
    end

    def update
        @user = current_user
        if (params[:first_name])
            @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
        else
            @user.update(password: params[:password])
        end
        redirect_back(fallback_location: root_path)
    end

    def password
    end

    def surveys
    end

    def teamhub
    end
end
