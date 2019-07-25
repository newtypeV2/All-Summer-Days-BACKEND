class CharClass < ApplicationRecord
    has_many :char_class_proficiencies
    has_many :proficiencies, through: :char_class_proficiencies
    has_many :char_class_skills
    has_many :skills, through: :char_class_skills
end
