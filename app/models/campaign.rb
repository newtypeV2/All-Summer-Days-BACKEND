class Campaign < ApplicationRecord
    has_many :campaign_users
    has_many :users, through: :campaign_users
    has_many :character_campaigns
    has_many :characters, through: :character_campaigns
end
