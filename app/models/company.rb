# == Schema Information
#
# Table name: companies
#
#  id                :bigint           not null, primary key
#  name              :string
#  ceo_name          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  corporate_id      :bigint
#  razon_social      :string
#  rfc               :string
#  address           :string
#  representative_id :bigint
#

class Company < ApplicationRecord
  has_many :clients
  belongs_to :representative, optional: true 
  belongs_to :corporate, optional: true
  accepts_nested_attributes_for :clients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :corporate, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :representative, reject_if: :all_blank, allow_destroy: true

  scope :without_corporate, -> { where(:corporate_id => nil)}
end
