class CompaniesController < ApplicationController
  def index
  end

  def new
    @company = Company.new
  end

  def create 
    @company = Company.new(company_params)
    if @company.save
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

  def company_params
    params.require(:company).permit(:name, :ceo_name, :corporate_id, corporate_attributes: [:name, :ceo_name])
  end
end
