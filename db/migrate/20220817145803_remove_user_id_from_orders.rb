class RemoveUserIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :order_id
    remove_column :teams, :user_id
  end
end
