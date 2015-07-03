class AddSimpleRoles < ActiveRecord::Migration
  def up
    #drop_table :roles
    add_column :users, :role, :string
  end

  def down
    create_table :roles
    remove_column :users, :role
  end
end
