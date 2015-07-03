class AddTripToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :trip_id, :integer
  end
end
