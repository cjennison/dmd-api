class AddPlotToSegments < ActiveRecord::Migration[5.0]
  def change
    add_column :segments, :plot, :text, limit: 65535
  end
end
