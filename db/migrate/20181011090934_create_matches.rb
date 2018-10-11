class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches, id: :uuid do |t|
      t.datetime :date_time
      t.references :location, foreign_key: true, type: :uuid
      t.references :home_team, foreign_key: { to_table: :teams }, type: :uuid
      t.references :away_team, foreign_key: { to_table: :teams }, type: :uuid
      t.integer :home_team_score
      t.integer :away_team_score

      t.timestamps
    end
  end
end
