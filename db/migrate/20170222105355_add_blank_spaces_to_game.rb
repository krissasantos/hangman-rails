class AddBlankSpacesToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :blanks_spaces, :string
  end
end
