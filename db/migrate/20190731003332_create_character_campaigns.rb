class CreateCharacterCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :character_campaigns do |t|
      t.integer :character_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end
