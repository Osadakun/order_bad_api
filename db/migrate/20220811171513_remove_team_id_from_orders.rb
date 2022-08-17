class RemoveTeamIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :team_id
  end
end
