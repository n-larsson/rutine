require "machinist/active_record"

Routine.blueprint do
  name { "Hire new employee" }
end

Task.blueprint do
  routine
  name { "Give keys" }
end

RoutineAssignment.blueprint do
  routine
  user_id { sn }
end
