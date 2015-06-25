class V1::RoutineAssignmentsController < ApplicationController
  def create
    routine = Routine.find(params[:routine_id])
    assignment = routine.assignments.create!(user_id: params[:user_id])

    render json: assignment, status: :created
  end

  def update
    routine = Routine.find(params[:routine_id])
    assignment = routine.assignments.where(user_id: params[:user_id]).find(params[:id])
    assignment.update_attributes!(finished_at: Time.current)

    render json: RoutineAssignmentSerializer.new(assignment).to_json, status: :ok
  end
end
