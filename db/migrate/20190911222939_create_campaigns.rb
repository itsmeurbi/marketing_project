class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :finish_date
      t.string :created_by

      t.timestamps
    end
  end
end
