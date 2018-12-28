class CreateGoalsJournalEntriesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :goals, :journal_entries do |t|
      t.index [:goal_id, :journal_entry_id]
    end
  end
end
