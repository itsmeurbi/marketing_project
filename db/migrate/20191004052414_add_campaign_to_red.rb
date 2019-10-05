class AddCampaignToRed < ActiveRecord::Migration[5.1]
  def change
    add_reference :reds, :campaign, foreign_key: true
  end
end
