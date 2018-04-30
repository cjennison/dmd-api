class CreateCampaignAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_assets do |t|
      t.belongs_to :campaign
      t.integer :campaign_assetable_id
      t.string :campaign_assetable_type
      t.timestamps
    end

    add_index :campaign_assets, [:campaign_assetable_id, :campaign_assetable_type], :name => 'campaign_asset_id_type_index'
  end
end
