class ChangeLineItemsToUseOrders < ActiveRecord::Migration
  def up
    remove_column :line_items, :participant_id
    add_column :line_items, :order_id, :integer
  end

  def down
    add_column :line_items, :participant_id, :references
    remove_column :line_items, :order_id
  end
end
