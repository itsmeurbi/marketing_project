module CampaignsHelper
  def clients 
    Client.order(:id)
  end

  def c_managers
    User.where(role_id: 2) 
  end
end
