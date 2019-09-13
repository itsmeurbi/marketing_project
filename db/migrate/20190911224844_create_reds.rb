class CreateReds < ActiveRecord::Migration[5.1]
  def change
    create_table :reds do |t|
      t.string :name

      t.timestamps
    end
  end
end
