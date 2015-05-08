class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :destination_specific_activity
      t.decimal :price

      t.timestamps
    end
    add_index :items, :destination_specific_activity_id
  end
end
