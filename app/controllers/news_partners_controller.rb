class NewsPartnersController < ApplicationController
    before_action :authenticate_admin!

    def show
    end

    def new
        @news_partner = NewsPartner.new
    end

    def create
        @news_partner = NewsPartner.new
        @news_partner.title = news_partner_params[:title]
        @news_partner.save
        redirect_to news_partners_path
    end

    def delete
    end

    def destroy
        @news_partner = NewsPartner.find(params[:id])
        @news_partner.delete
        redirect_to news_partners_path
    end

    def update
        @news_partner = NewsPartner.find(params[:id])
        @news_partner.update(api_key: params[:api_key])
        redirect_to news_partners_path
    end

    def change_status
        
    end

    def news_partner_params
        params.require(:news_partner).permit(:id, :title)
    end

end
