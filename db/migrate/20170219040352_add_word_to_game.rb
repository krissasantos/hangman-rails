class AddWordToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :word, :string
  end
end
