class HealthController < ApplicationController
  def show
    render text: "OK", status: :ok
  end
end
