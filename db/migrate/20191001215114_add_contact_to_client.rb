class AddContactToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :contact_name, :string
    add_column :clients, :contact_tel, :string
    add_column :clients, :contact_cel, :string
    add_column :clients, :contact_email, :string
  end
end
