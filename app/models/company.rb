# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  ceo_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
  has_one :client
  accepts_nested_attributes_for :client, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
