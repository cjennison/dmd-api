class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :description, limit: 65535

      t.timestamps
    end
  end
end
