class Admin::Workouts::SessionsController < ApplicationController
  def index
  end

  def new
    @workout = ::Workouts::Session.new
  end

  def create
    @workout = current_user.workouts_sessions.build(workout_params)
    if @workout.save
      redirect_to admin_workouts_path
    else
      render :new
    end
  end

  private

    def workout_params
      params.require(:workouts_session).permit(:start, :duration, :exercise)
    end
end
