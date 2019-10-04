# == Schema Information
#
# Table name: campaign_employees
#
#  id          :bigint           not null, primary key
#  start_date  :date
#  finish_date :date
#  campaign_id :bigint
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CampaignEmployee < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
end
