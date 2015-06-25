class V1::TasksController < ApplicationController
  def create
    routine = Routine.find(params[:routine_id])
    task = routine.tasks.create(params.permit(:name))

    if task.valid?
      render json: task, status: :created
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end
end
