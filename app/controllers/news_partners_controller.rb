class NewsPartnersController < ApplicationController
    def show
        @news_partners = NewsPartner.all
        @news_partner = NewsPartner.new
    end

    def new
    end

end
