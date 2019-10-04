class AddInfoToCorporate < ActiveRecord::Migration[5.1]
  def change
    add_column :corporates, :razon_social, :string
    add_column :corporates, :rfc, :string
    add_column :corporates, :address, :string
  end
end
