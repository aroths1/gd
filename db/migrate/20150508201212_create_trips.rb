class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :group
      t.references :destination_specific_activity
      t.date :date
      t.integer :leader

      t.timestamps
    end
    add_index :trips, :group_id
    add_index :trips, :destination_specific_activity_id
  end
end
