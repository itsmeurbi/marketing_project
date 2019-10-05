# == Schema Information
#
# Table name: reds
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Red < ApplicationRecord
  belongs_to :campaign
end
