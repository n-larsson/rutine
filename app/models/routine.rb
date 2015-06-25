class Routine < ActiveRecord::Base
  validates_presence_of :name
  has_many :tasks
  has_many :assignments, class_name: "RoutineAssignment"
end
