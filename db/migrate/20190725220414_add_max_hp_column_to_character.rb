class AddMaxHpColumnToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :max_hp, :integer
    add_column :characters, :wisdom, :integer
  end
end
