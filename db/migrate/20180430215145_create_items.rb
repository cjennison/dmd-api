class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.belongs_to :user, index: true

      t.string :name
      t.string :description, limit: 65535
      t.string :value

      t.timestamps
    end
  end
end
