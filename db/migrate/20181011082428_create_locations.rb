class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
