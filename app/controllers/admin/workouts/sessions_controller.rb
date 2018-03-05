class Admin::Workouts::SessionsController < ApplicationController
  before_action :set_workout, only: [:destroy]

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

  def destroy
    @workout.destroy
    redirect_to admin_workouts_path
  end

  private
    
    def set_workout
      @workout = ::Workouts::Session.find(params[:id])
    end

    def workout_params
      params.require(:workouts_session).permit(:start, :duration, :exercise)
    end
end
