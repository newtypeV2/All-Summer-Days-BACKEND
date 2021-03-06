class Proficiency < ApplicationRecord
    has_many :char_class_proficiencies
    has_many :char_classes, through: :char_class_proficiencies
    has_many :character_proficiencies
    has_many :characters, through: :character_proficiencies
end
