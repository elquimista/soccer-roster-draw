class CreatePlayersTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :players_teams, id: :uuid do |t|
      t.references :player, foreign_key: true, type: :uuid
      t.references :team, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
