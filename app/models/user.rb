class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :characters
  has_many :campaign_users
  has_many :campaigns, through: :campaign_users

end
