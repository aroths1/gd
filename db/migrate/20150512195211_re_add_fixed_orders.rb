class ReAddFixedOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.references :user
      t.boolean :paid
 
      t.timestamps null: false
    end
  end

  def down
  end
end
