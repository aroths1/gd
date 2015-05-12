class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :references
      t.string :participant
      t.string :paid
      t.string :boolean

      t.timestamps
    end
  end
end
