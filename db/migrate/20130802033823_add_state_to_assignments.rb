class AddStateToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :state, :integer
    add_index :assignments, :state
  end
end
