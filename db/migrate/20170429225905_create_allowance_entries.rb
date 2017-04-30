class CreateAllowanceEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :allowance_entries do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.date :entry_date, null: false
      t.decimal :price, precision: 12, scale: 2, null: false
      t.string :payee
      t.string :category
      t.string :notes

      t.timestamps
    end
  end
end
