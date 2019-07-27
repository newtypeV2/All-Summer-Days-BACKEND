class AddColumnToCharClass < ActiveRecord::Migration[5.2]
  def change
    add_column :char_classes, :proficiency_skill, :integer
    add_column :char_classes, :proficiency_tools, :integer
    add_column :char_classes, :proficiency_instruments, :integer
    add_column :char_classes, :hit_die, :string
  end
end
