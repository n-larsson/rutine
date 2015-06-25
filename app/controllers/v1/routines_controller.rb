class V1::RoutinesController < ApplicationController
  def create
    routine = Routine.create(params.permit(:name))

    if routine.valid?
      render json: routine, status: :created
    else
      render json: routine.errors, status: :unprocessable_entity
    end
  end
end
