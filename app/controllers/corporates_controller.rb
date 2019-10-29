class CorporatesController < ApplicationController
  def index
  end

  def new
    @corporate = Corporate.new
    @repre = Representative.new
  end

  def create 
    @corporate = Corporate.new(corporate_params)
    if @corporate.save
      update_companies_info(params[:companies_id]) if params[:companies_id]
      redirect_to root_path 
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  private 

  def corporate_params 
    params.require(:corporate).permit(:name, :ceo_name, :razon_social, :address, :rfc, :companies_id, 
                                        representative_attributes: [:name, :rfc, :email, :tel, :cel, :position], 
                                        companies_attributes: [:name, :ceo_name, :razon_social, :address, :rfc])
  end

  def update_companies_info(companies)
    companies.each do |com, value| 
      Company.find(com).update(corporate_id: @corporate.id) if value == "1"
    end
  end
end
