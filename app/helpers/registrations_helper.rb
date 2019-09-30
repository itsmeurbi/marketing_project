module RegistrationsHelper
  def user_type
    return Role.all if !user_signed_in? || current_user.role.name == 'admin'
    return Role.where.not(name: 'admin') if current_user.role.name != 'admin'
  end
end
