class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :class_id, :level, :strength, :dexterity, :constitution, :intelligence, :charisma, :hitpoints, :age, :height, :weight, :eyes, :skin, :hair, :background, :alignment
  has_one :char_class
    has_many :skill_proficiencies
    has_many :skills, through: :skill_proficiencies
 
end
