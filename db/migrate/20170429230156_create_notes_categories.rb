class CreateNotesCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :notes_categories do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps
    end
  end
end
