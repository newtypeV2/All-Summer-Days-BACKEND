class CreateSkillProficiencies < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_proficiencies do |t|
      t.integer :character_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
