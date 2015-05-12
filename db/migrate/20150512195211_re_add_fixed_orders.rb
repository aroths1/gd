class ReAddFixedOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.references :participant_id
      t.boolean :paid
 
      t.timestamps null: false
    end
  end

  def down
  end
end
