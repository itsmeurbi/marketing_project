class AddCompanyToCorporate < ActiveRecord::Migration[5.1]
  def change
    add_reference :companies, :corporate, index: false
  end
end
