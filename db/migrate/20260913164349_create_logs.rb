class CreateLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :logs do |t|
      t.references :boss, null: false, foreign_key: true

      t.timestamps
    end

    add_index :logs, :created_at
  end
end
