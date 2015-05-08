class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :person
      t.integer :lead_participant
      t.references :trip

      t.timestamps
    end
    add_index :participants, :person_id
    add_index :participants, :trip_id
  end
end
