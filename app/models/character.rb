class Character < ApplicationRecord
    belongs_to :char_class
    has_many :character_proficiencies
    has_many :proficiencies, through: :character_proficiencies
    has_one_attached :avatar
    # has_many :skill_proficiencies
    # has_many :skills, through: :skill_proficiencies

    include Rails.application.routes.url_helpers

    def cover_url 
      Rails.application.routes.url_helpers.rails_blob_path(self.avatar, only_path: true)

    end

    def image_download
      # link_to(self.avatar)
    end

end
