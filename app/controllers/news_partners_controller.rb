class NewsPartnersController < ApplicationController
    before_action :authenticate_admin!
    add_flash_types :info, :error, :warning,:success

    def show
    end

    def new
        @news_partner = NewsPartner.new
    end

    def create
        if NewsPartner.find_by title: news_partner_params[:title]
            redirect_to "/news_partners"
        else
            @news_partner = NewsPartner.new
            @news_partner.title = news_partner_params[:title]
            @news_partner.save
            redirect_to news_partners_path
        end
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
        @news_partner.update(api_key: params[:api_key], default_sources: params[:default_sources])
        @news_partner.save
        redirect_to news_partners_path
    end

    def change_status
        @news_partner = NewsPartner.find(params[:id])
        status = @news_partner.active ? false : true
        @news_partner.update(active: status)
        redirect_to news_partners_path
    end


    private
    
    def news_partner_params
        params.require(:news_partner).permit(:id, :title, :api_key, :default_sources)
    end

end
