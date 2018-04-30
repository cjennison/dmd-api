class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.belongs_to :user, index: true

      t.string :name
      t.string :description, limit: 65535
      t.integer :hitpoints
      t.string :hit
      t.string :damage
      t.string :armor_class
      t.timestamps
    end
  end
end
