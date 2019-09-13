# == Schema Information
#
# Table name: campaign_employees
#
#  id          :bigint           not null, primary key
#  start_date  :date
#  finish_date :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CampaignEmployee < ApplicationRecord
  belongs_to :Campaign
  belongs_to :User
end
