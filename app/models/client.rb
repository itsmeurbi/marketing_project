# == Schema Information
#
# Table name: clients
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  cellphone  :string
#  birthdate  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ApplicationRecord
  belongs_to :company
end
