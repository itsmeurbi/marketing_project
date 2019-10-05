class AddCompanyAndCorporateToClient < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :company, index: false
    add_reference :clients, :corporate, index: false
  end
end
