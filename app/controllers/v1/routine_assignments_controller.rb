class V1::RoutineAssignmentsController < ApplicationController
  def create
    routine = Routine.find(params[:routine_id])
    assignment = routine.assignments.create!(user_id: params[:user_id])

    render json: assignment, status: :created
  end
end
