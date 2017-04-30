class CreateNotesEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :notes_entries do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :body
      t.belongs_to :notes_category, foreign_key: true
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :notes_sequence, foreign_key: true

      t.timestamps
    end
  end
end
