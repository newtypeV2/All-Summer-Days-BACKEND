class CreateCharClassSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :char_class_skills do |t|
      t.integer :char_class_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
