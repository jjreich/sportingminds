class AddTeamIdToGoals < ActiveRecord::Migration[5.1]
  def change
  	add_column :goals, :team_id, :integer
  	add_index :goals, :team_id
  end
end
