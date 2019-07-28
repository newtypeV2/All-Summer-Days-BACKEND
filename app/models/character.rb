class Character < ApplicationRecord
    belongs_to :char_class
    has_many :character_proficiencies
    has_many :proficiencies, through: :character_proficiencies
    has_one_attached :avatar
    # has_many :skill_proficiencies
    # has_many :skills, through: :skill_proficiencies

    include Rails.application.routes.url_helpers

    def cover_url 
        rails_blob_path(self.avatar, disposition: "attachment", only_path: true)
      end

end
