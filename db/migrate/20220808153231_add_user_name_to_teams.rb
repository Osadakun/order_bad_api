class AddUserNameToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :user_name, :string
  end
end
