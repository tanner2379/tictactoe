class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :player
      t.integer :column
      t.integer :row
      
      t.timestamps
    end
  end
end
