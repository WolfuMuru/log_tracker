class CreateLogPlayers < ActiveRecord::Migration[8.1]
  def change
    def change
      create_table :log_players do |t|
        t.references :log, null: false, foreign_key: true
        t.references :player, null: false, foreign_key: true
        t.references :profession, null: false, foreign_key: true

        t.timestamps
      end

      add_index :log_players, [:log_id, :player_id], unique: true
    end
  end
end
