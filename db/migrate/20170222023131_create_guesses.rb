class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.string :guess
      t.integer :game_id
    end
  end
end
