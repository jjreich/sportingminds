class AddUserIdGoalIdJournalEntryIdToComments < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :user_id, :integer
  	add_index :comments, :user_id
  	add_column :comments, :goal_id, :integer
  	add_index :comments, :goal_id
  	add_column :comments, :journal_entry_id, :integer
  	add_index :comments, :journal_entry_id
  end
end
