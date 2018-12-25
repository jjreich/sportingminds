json.extract! goal, :id, :name, :sport, :goalType, :goalStartDate, :goalEndDate, :training, :recurring, :goalInterval, :goalNumber, :trainingType, :description, :accountabilityPartners, :percentComplete, :active, :complete, :user_id, :created_at, :updated_at
json.url goal_url(goal, format: :json)
