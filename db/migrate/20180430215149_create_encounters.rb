class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.belongs_to :campaign
      t.belongs_to :segment
      t.string :name
      t.string :description, limit: 65535

      t.timestamps
    end
  end
end
