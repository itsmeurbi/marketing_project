module DashboardHelper
  def set_user
    return 'login' if !user_signed_in?
    Role.all.each do |role|
      if role == current_user.role 
        return role.name
      end
    end 
  end

  def campaigns 
    Campaign.order(:id)
  end

  def companies
    Company.order(:id)
  end

  def corporates 
    Corporate.order(:id)
  end

  def users
    User.where.not(role_id: [1,7]).order(:id)
  end

  def get_corporate(id) 
    Corporate.find(id).name
  end

  def campaigns_comm
    Campaign.joins(:campaign_employees, :users).where('users.id = ?', current_user.id)
  end

  def admins 
    User.where(role_id: 1)
  end

  def corp_or_comp(camp)
    return Campaign.find(camp).client.company.name if Campaign.find(camp).client.company
    return Campaign.find(camp).client.corporate.name if Campaign.find(camp).client.corporate
  end
end
