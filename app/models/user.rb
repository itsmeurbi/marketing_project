# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string           not null
#  birthday               :date
#  status                 :string(1)
#  user_type              :string(1)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  unconfirmed_email      :string
#  role_id                :bigint
#

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  belongs_to :role, foreign_key: "role_id"
  has_many :campaign_employees
  has_many :campaigns, through: :campaign_employees
  has_and_belongs_to_many :nodos
end
