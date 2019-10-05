# == Schema Information
#
# Table name: representatives
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  rfc        :string
#  tel        :string
#  cel        :string
#  position   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Representative < ApplicationRecord
  has_many :companies
  has_one :corporate

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :rfc
  validates_presence_of :tel
  validates_presence_of :cel
  validates_presence_of :position
end
