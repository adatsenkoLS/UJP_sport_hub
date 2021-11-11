class NewsPartnersController < ApplicationController
    def show
        @news_partners = NewsPartner.all
        @news_partner = NewsPartner.new
    end

    def new
        @news_partner = NewsPartner.new
    end

    def create
        @news_partner = NewsPartner.new
        @news_partner.title = news_partner_params[:title]
        @news_partner.save
        redirect_to :news_partners
    end

    def delete
    end

    def news_partner_params
        params.require(:news_partner).permit(:title)
    end

end
