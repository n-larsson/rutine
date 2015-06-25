class CreateRoutineAssignments < ActiveRecord::Migration
  def change
    create_table :routine_assignments do |t|
      t.belongs_to :routine, index: true, foreign_key: true, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
