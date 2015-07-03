class EliminatePeopleAndParticipants < ActiveRecord::Migration
  def up
    drop_table :people
    drop_table :participants
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_phone
    end
    change_table :orders do |t|
      t.remove :participant_id
      t.references :users
    end
  end

  def down
     create_table :people do |t|
        t.string :first_name
        t.string :last_name
        t.string :email
        t.string :mobile_phone
        t.timestamps
      end
      create_table :participants do |t|
        t.references :person
        t.integer :lead_participant
        t.references :trip
        t.timestamps
      end
    add_index :participants, :person_id
    add_index :participants, :trip_id
    
    change_table :users do |t|
      t.remove :first_name
      t.remove :last_name
      t.remove :mobile_phone
    end
    change_table :orders do |t|
      t.references :participant
      t.remove :users
    end
    
  end
end
