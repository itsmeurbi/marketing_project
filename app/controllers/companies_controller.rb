class CompaniesController < ApplicationController
  def index
  end

  def new
    @company = Company.new
    @repre = Representative.new
  end

  def create 
    if params[:rep][:si] == '0'
      @company = Company.new(company_params)
    else
      @company = Company.new(company_params_without_rep)
    end
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
    params.require(:company).permit(:name, :ceo_name, :rfc, :address, :razon_social, :corporate_id, representative_attributes: [:name, :rfc, :email, :tel, :cel, :position])
  end

  def company_params_without_rep 
    params.require(:company).permit(:name, :ceo_name, :rfc, :address, :razon_social, :corporate_id).merge(representative_id: Corporate.find(params[:company][:corporate_id]).representative.id)
  end
end
