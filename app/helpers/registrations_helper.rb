module RegistrationsHelper
  def user_type
    Role.all
  end
end
