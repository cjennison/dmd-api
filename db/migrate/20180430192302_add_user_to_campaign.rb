class AddUserToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_reference :campaigns, :user, index: true
  end
end
