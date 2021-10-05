class CabinetController < ApplicationController
    #before_action :authenticate_user!

    def personal
    end

    def update
        current_user = User.new
        current_user.first_name = params[:first_name]
        current_user.last_name = params[:last_name]
        current_user.email = params[:email]
    end

    def password
    end

    def change
    end

    def surveys
    end

    def teamhub
    end
end
