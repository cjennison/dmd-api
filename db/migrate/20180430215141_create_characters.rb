class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.belongs_to :user, index: true

      t.string :name
      t.string :description, limit: 65535
      t.string :biography, limit: 65535
      t.integer :hitpoints
      t.string :alignment
      t.string :race
      t.string :gender

      t.timestamps
    end
  end
end
