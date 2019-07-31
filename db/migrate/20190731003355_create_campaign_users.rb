class CreateCampaignUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_users do |t|
      t.integer :user_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end
