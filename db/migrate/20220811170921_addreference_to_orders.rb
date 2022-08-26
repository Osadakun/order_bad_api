class AddreferenceToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :teams, foreign_key: true
  end
end
