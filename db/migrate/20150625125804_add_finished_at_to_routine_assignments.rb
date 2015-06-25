class AddFinishedAtToRoutineAssignments < ActiveRecord::Migration
  def change
    add_column :routine_assignments, :finished_at, :datetime, null: true
    add_index :routine_assignments, :finished_at
  end
end
