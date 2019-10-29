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

  def clients 
    Client.order(:id)
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

  def nodes(user_id)
    Nodo.includes(:users).where("users.id = ?", user_id).references(:users)
  end

  def user_options 
    case current_user.role_id
    when 1
      options = ["Campañas", "Empleados", "Clientes"]
    when 2
      options = ["Campañas", "Calendario"]
    when 3
      options = ["Tematicas"]
    when 4
      options = ["Tematicas"]
    when 5
      options = ["Empleados"]
    when 6
      options = ["Empresas", "Corporativos", "Clientes"]
    when 7
      options = ["Administradores"]
    end
    options
  end

end
