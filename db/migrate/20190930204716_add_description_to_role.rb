class AddDescriptionToRole < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :descr, :string
  end
end
