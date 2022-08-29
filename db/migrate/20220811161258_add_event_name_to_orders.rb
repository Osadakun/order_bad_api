class AddEventNameToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :event_name, :string
  end
end
