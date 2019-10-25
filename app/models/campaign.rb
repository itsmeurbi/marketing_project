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
#  red_id      :bigint
#

class Campaign < ApplicationRecord
  has_many :campaign_employees
  has_many :users, through: :campaign_employees
  belongs_to :client
  belongs_to :red, optional: true
  accepts_nested_attributes_for :red, reject_if: :all_blank, allow_destroy: true
end
