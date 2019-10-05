# == Schema Information
#
# Table name: campaigns
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  start_date  :date
#  finish_date :date
#  created_by  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  client_id   :bigint
#

class Campaign < ApplicationRecord
  has_many :campaign_employees
  has_many :users, through: :campaign_employees
  belongs_to :client
  has_one :red
end
