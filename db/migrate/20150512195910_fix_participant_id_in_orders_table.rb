class FixParticipantIdInOrdersTable < ActiveRecord::Migration
  def up
    remove_column :orders, :participant_id_id
    add_column :orders, :participant_id, :integer
  end

  def down
  end
end
