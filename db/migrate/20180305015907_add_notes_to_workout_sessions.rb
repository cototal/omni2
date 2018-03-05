class AddNotesToWorkoutSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts_sessions, :notes, :text
  end
end
