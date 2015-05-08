class CreateDestinationSpecificActivities < ActiveRecord::Migration
  def change
    create_table :destination_specific_activities do |t|
      t.references :activity
      t.references :destination
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :destination_specific_activities, :activity_id
    add_index :destination_specific_activities, :destination_id
  end
end
