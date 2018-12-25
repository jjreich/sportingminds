json.extract! journal_entry, :id, :sport, :dateTimeOfTraining, :duration, :organizedPractice, :trainingAccomplished, :motivationLevel, :performanceLevel, :user_id, :created_at, :updated_at
json.url journal_entry_url(journal_entry, format: :json)
