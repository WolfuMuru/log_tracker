class CreatePlayers < ActiveRecord::Migration[8.1]
  def change
    create_table :players do |t|
      t.string :ign, null: false

      t.timestamps
    end

    add_index :players, :ign, unique: true
  end
end
