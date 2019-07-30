class AddUserIdToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :user_id, :integer
  end
end
