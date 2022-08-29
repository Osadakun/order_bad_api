class RenameNameColumnToTeams < ActiveRecord::Migration[7.0]
  def change
    rename_column :teams, :name, :event_name
  end
end
