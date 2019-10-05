module RegistrationsHelper
  def user_type
    return Role.all.order(:id) if !user_signed_in? || current_user.role.name == 'admin'
    return Role.where.not(name: 'admin').order(:id) if current_user.role.name != 'admin'
  end
end
