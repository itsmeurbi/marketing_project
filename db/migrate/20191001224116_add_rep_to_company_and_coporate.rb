class AddRepToCompanyAndCoporate < ActiveRecord::Migration[5.1]
  def change
    add_reference :companies, :representative, index: true
    add_reference :corporates, :representative, index: true
  end
end
