class CreateJournalEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_entries do |t|
      t.string :sport
      t.datetime :dateTimeOfTraining
      t.integer :duration
      t.boolean :organizedPractice
      t.text :trainingAccomplished
      t.integer :motivationLevel
      t.integer :performanceLevel

      t.timestamps
    end
  end
end
