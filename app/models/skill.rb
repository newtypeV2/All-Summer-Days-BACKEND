class Skill < ApplicationRecord
    has_many :char_class_skills
    has_many :char_classes, through: :char_class_skills
    has_many :skill_proficiencies
    has_many :characters, through: :skill_proficiencies
end
