class AddUserIdToJournalEntries < ActiveRecord::Migration[5.1]
  def change
  	add_column :journal_entries, :user_id, :integer
  	add_index :journal_entries, :user_id
  end
end
