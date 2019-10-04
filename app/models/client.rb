# == Schema Information
#
# Table name: clients
#
#  id            :bigint           not null, primary key
#  name          :string
#  email         :string
#  cellphone     :string
#  rfc           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  contact_name  :string
#  contact_tel   :string
#  contact_cel   :string
#  contact_email :string
#  company_id    :bigint
#  corporate_id  :bigint
#

class Client < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :corporate, optional: true
  has_many :campaigns
end
