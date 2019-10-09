module CampaignsHelper
  def clients 
    Client.order(:id)
  end

  def c_managers
    User.where(role_id: 2) 
  end

  def designers 
    User.where(role_id: 4)
  end

  def generadors
    User.where(role_id: 3)
  end
end
