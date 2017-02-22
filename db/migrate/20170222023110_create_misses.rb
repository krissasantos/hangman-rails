class CreateMisses < ActiveRecord::Migration[5.0]
  def change
    create_table :misses do |t|
      t.string :miss
      t.integer :game_id
    end
  end
end
