class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.references :trip

      t.timestamps
    end
    add_index :contacts, :email
    add_index :contacts, :trip_id
  end
end
