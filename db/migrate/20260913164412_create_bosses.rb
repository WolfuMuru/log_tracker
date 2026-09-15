class CreateBosses < ActiveRecord::Migration[8.1]
  def change
    create_table :bosses do |t|
      t.string :name, null: false
      t.string :boss_type, null: false
      t.integer :wing

      t.timestamps
    end

    add_index :bosses, :name
    add_index :bosses, :boss_type
  end
end
