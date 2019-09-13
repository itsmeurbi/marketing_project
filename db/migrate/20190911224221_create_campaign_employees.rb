class CreateCampaignEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_employees do |t|
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
