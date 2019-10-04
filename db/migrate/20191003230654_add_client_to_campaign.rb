class AddClientToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :client, foreign_key: true
  end
end
