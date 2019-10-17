class AddRedToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :red, foreign_key: true
    remove_reference :reds, :campaign, foreign_key: true
  end
end
