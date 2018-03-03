class CreateWorkoutsSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts_sessions do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.datetime :start
      t.integer :duration
      t.string :exercise

      t.timestamps
    end
  end
end
