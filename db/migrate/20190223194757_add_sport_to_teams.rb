class AddSportToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :sport, :string
  end
end
