class ChangeTablesToAccountForUsersTable < ActiveRecord::Migration
  def up
    remove_column :people, :email
    add_column :people, :dob, :date
  end
  def down
    add_column :people, :email, :string
    remove_column :people, :dob
  end
end
