# == Schema Information
#
# Table name: nodos
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string
#  red_id     :bigint
#

class Nodo < ApplicationRecord
  has_ancestry
  has_and_belongs_to_many :users
  belongs_to :red
end
