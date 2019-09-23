# == Schema Information
#
# Table name: corporates
#
#  id         :bigint           not null, primary key
#  name       :string
#  ceo_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Corporate < ApplicationRecord
  has_many :companys
  accepts_nested_attributes_for :companys, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
