class CabinetController < ApplicationController
    #before_action :authenticate_user!

    def personal
=begin
        @avatar = current_user[:avatar]
        @first_name = current_user[:first_name]
        @last_name = current_user[:last_name]
        @email = current_user[:email]
=end
    end

    def update_profile
        comments_from_form = params['myform']['fname']
        @first_name = comments_from_form
    end

    def password
    end

    def surveys
    end

    def teamhub
    end
end
