class RemoveUserNameFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :user_name
  end
end
