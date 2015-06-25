class RoutineAssignment < ActiveRecord::Base
  validates_presence_of :user_id, :routine
  belongs_to :routine
end
