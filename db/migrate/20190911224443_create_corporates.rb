class CreateCorporates < ActiveRecord::Migration[5.1]
  def change
    create_table :corporates do |t|
      t.string :name
      t.string :ceo_name

      t.timestamps
    end
  end
end
