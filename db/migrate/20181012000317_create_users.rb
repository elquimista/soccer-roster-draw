class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
