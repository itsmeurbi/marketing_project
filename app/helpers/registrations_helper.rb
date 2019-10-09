module RegistrationsHelper
  def user_type
    return Role.where.not(name: ['admin', 'agency']).order(:id) 
  end
end
