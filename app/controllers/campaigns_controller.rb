class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:edit, :update, :destroy]

  def new
    @campaign = Campaign.new
  end

  def create 
    @campaign = Campaign.new(permited_params)
    if @campaign.save
      redirect_to root_path, notice: 'Campaña creada con éxito'
    else 
      byebug
      render 'new'
    end 
  end

  def edit 
    respond_to do |format|
      format.html do
        build_html
      end
      format.json do
        build_json
      end
    end
  end

  def update 
    if @campaign.update_attributes(permited_params) 
      redirect_to root_path, notice: 'Campaña actualizada con éxito'
    else 
      byebug
      render 'new'
    end  
  end

  private 

    def permited_params
      params.require(:campaign).permit(:name, :description, :start_date, :finish_date, :client_id, :user_ids, 
        red_attributes: [:id, :name])
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def build_html
      @campaign = current_user.campaigns.find(params[:id])
      if !@campaign.red 
        @red = Red.new
      else
        @red = @campaign.red
      end
    end
  
    def build_json
      @campaign = current_user.campaigns.find(params[:id])
      hash = {}
      @campaign.red.nodos.each { |n| hash[n.id] = n.child_ids } 
      render json: { nodes: @campaign.red.nodos, children: hash  }
    end
end
