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

  private 

    def permited_params
      params.require(:campaign).permit(:name, :description, :start_date, :finish_date, :client_id, :user_ids)
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end
end
