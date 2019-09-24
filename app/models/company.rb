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
  belongs_to :corporate, optional: true
  accepts_nested_attributes_for :client, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :corporate, reject_if: :all_blank, allow_destroy: true

  scope :without_corporate, -> { where(:corporate_id => nil)}
end
