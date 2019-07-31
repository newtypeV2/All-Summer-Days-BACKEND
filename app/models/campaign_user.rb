class CampaignUser < ApplicationRecord
    belongs_to :user
    belongs_to :campaign
end
