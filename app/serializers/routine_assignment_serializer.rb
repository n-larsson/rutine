class RoutineAssignmentSerializer < ActiveModel::Serializer
  attributes :id, :routine_id, :user_id, :finished_at

  def finished_at
    object.finished_at.try(:iso8601)
  end
end
