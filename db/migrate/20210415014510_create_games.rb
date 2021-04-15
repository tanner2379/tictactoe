class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :winner, default: nil
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
