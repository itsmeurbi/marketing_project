module CompaniesHelper
  def corporates 
    Corporate.all.order(:id)
  end
end
