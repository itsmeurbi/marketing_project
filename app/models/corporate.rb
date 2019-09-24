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
  has_many :companies, inverse_of: :corporate
  accepts_nested_attributes_for :companies, reject_if: :all_blank, allow_destroy: true
end
