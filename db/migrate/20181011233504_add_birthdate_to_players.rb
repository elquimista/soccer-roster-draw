class AddBirthdateToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :birthdate, :date
  end
end
