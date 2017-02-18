class AddMaxLengthToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :maxLength, :integer
  end
end
