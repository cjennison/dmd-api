class CreateSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :segments do |t|
      t.string :name, null: false
      t.string :description, limit: 65535
      t.string :hash, null: false
      t.belongs_to :campaign, index: true
      t.text :log

      t.timestamps
    end
  end
end
