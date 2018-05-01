class ChangeSegmentHashToKeyPath < ActiveRecord::Migration[5.0]
  def change
    rename_column :segments, :hash, :key_url
  end
end
