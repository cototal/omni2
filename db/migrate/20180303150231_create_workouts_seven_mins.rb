class CreateWorkoutsSevenMins < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts_seven_mins do |t|
      t.string :exercise, null: false
      t.text :description
      t.integer :position
      t.string :picture

      t.timestamps
    end
  end
end
