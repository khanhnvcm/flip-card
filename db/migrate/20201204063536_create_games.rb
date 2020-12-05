class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :user
      t.integer :move
      t.integer :time
      t.integer :point

      t.timestamps
    end
  end
end
