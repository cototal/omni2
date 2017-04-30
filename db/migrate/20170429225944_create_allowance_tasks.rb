class CreateAllowanceTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :allowance_tasks do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.string :goal, null: false
      t.string :reward, null: false
      t.integer :days, array: true, default: []
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
