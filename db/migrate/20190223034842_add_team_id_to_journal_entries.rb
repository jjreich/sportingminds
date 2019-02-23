class AddTeamIdToJournalEntries < ActiveRecord::Migration[5.1]
  def change
  	add_column :journal_entries, :team_id, :integer
  	add_index :journal_entries, :team_id
  end
end
