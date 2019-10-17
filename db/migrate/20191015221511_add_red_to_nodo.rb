class AddRedToNodo < ActiveRecord::Migration[5.1]
  def change
    add_reference :nodos, :red, foreign_key: true
  end
end
