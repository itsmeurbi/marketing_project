class AddAncestryToNodo < ActiveRecord::Migration[5.1]
  def change
    add_column :nodos, :ancestry, :string
    add_index :nodos, :ancestry
  end
end
