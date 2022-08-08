class AddTeamIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :team_id, :integer
  end
end
