class AddDifficultyToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :difficulty, :integer
  end
end
