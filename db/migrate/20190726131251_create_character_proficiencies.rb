class CreateCharacterProficiencies < ActiveRecord::Migration[5.2]
  def change
    create_table :character_proficiencies do |t|
      t.integer :character_id
      t.integer :proficiency_id

      t.timestamps
    end
  end
end
