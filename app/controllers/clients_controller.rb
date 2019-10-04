class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create 
    @client = Client.new(permited_params)
    if @client.save 
      redirect_to root_path, notice: 'Cliente guardado con éxito'
    else
      byebug
      render 'new', notice: @client.errors
    end
  end

  private 

    def permited_params
      params.require(:client).permit(:name, :email, :cellphone, :rfc, :contact_name, :contact_tel, :contact_cel, :contact_email, :corporate_id, :company_id)
    end
end
