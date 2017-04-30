class CreateNotesSequences < ActiveRecord::Migration[5.1]
  def change
    create_table :notes_sequences do |t|
      t.string :name, null: false
      t.string :description
      t.belongs_to :notes_category, foreign_key: true

      t.timestamps
    end
  end
end
