class Character < ApplicationRecord
    has_one :char_class
    has_many :skill_proficiencies
    has_many :skills, through: :skill_proficiencies
end
