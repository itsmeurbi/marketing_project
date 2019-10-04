class AddInfoToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :razon_social, :string
    add_column :companies, :rfc, :string
    add_column :companies, :address, :string
  end
end
