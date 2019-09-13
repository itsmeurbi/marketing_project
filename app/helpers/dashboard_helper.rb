module DashboardHelper
  def set_user
    return 'login' if !user_signed_in?
    Role.all.each do |role|
      if role == current_user.role 
        return role.name
      end
    end 
  end
end
