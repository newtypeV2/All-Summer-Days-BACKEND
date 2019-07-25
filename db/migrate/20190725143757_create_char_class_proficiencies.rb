class CreateCharClassProficiencies < ActiveRecord::Migration[5.2]
  def change
    create_table :char_class_proficiencies do |t|
      t.integer :char_class_id
      t.integer :proficiency_id

      t.timestamps
    end
  end
end
