class Admin::Workouts::DashboardController < ApplicationController
  def index
    @workouts = current_user.workouts_sessions.order(start: :desc)
  end
end
