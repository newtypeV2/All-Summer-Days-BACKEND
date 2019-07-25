class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :firstname
      t.string :lastname
      t.integer :class_id
      t.integer :level
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :charisma
      t.integer :hitpoints
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :eyes
      t.string :skin
      t.string :hair
      t.string :background
      t.string :alignment

      t.timestamps
    end
  end
end
