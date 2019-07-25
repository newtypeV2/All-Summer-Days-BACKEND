class CreateCharClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :char_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
