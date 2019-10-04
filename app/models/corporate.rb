# == Schema Information
#
# Table name: corporates
#
#  id                :bigint           not null, primary key
#  name              :string
#  ceo_name          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  razon_social      :string
#  rfc               :string
#  address           :string
#  representative_id :bigint
#

class Corporate < ApplicationRecord
  has_many :clients
  belongs_to :representative
  has_many :companies, inverse_of: :corporate
  accepts_nested_attributes_for :companies, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :representative, reject_if: :all_blank, allow_destroy: true
end
