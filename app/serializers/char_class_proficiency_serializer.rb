class CharClassProficiencySerializer < ActiveModel::Serializer
  attributes :id, :char_class_id, :proficiency_id
  belongs_to :char_class
  belongs_to :proficiency
end
