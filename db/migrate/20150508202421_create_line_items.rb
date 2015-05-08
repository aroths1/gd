class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :participant
      t.references :item
      t.integer :quantity

      t.timestamps
    end
    add_index :line_items, :participant_id
    add_index :line_items, :item_id
  end
end
