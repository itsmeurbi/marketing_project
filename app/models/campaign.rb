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
#

class Campaign < ApplicationRecord
  has_many :users, through: :campaign_employees
end
