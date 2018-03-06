class Admin::Workouts::SevenMinsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @exercises = ::Workouts::SevenMin.order(position: :desc)
  end

  def create
    Rails.logger.info("WE ARE HERE")
    @exercise = ::Workouts::SevenMin.new(seven_min_params)
    Rails.logger.info(@exercise.inspect)
    if @exercise.save
      render json: @exercise.to_json
    else
      head :no_content
    end
  end

  def list
    render json: {a: 1}
  end

  private

    def seven_min_params
      params.require(:seven_min).permit(:description, :exercise, :position)
    end
end
