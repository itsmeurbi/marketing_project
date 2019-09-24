module DashboardHelper
  def set_user
    return 'login' if !user_signed_in?
    Role.all.each do |role|
      if role == current_user.role 
        return role.name
      end
    end 
  end

  def companies
    Company.all
  end

  def corporates 
    Corporate.all
  end

  def users
    User.all
  end

  def get_corporate(id) 
    Corporate.find(id).name
  end
end
