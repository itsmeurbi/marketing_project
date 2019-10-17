class CreateJoinTableNodoUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :nodos, :users do |t|
      t.references :nodo, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
