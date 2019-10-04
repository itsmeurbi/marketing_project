module ClientsHelper
  def clients
    Client.order(:id)
  end

  def corporates 
    Corporate.order(:id)
  end

  def companies
    Company.order(:id) 
  end

  def campaign(client)
    if Campaign.find_by(client_id: client)
      return Campaign.find_by(client_id: client).name 
    else
      return 'Sin asignar'
    end
  end
end
