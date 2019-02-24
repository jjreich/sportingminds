class AddPracticePlayersToJournalEntries < ActiveRecord::Migration[5.1]
  def change
  	add_column :journal_entries, :practice_players, :integer, array: true, default: []
  end
end
