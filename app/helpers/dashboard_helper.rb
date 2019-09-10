module DashboardHelper
  def set_user
    return 'login' if !user_signed_in?
    case current_user.user_type 
    when 'A'
      return 'admin'
    when 'R'
      return 'rh'
    when 'C'
      return 'community'
    when 'V'
      return 'sales'
    when 'G'
      return 'generador'
    when 'D'
      return 'designer'
    end
  end

end
