class JournalEntry < ApplicationRecord

	belongs_to :user
	has_many :comments
	has_and_belongs_to_many :goals

	after_save :adjust_completion_percentage_of_associated_goal, :is_goal_complete?

	private

	def adjust_completion_percentage_of_associated_goal

		trainingCount = 0

		goalHashes = {}

		self.goals.each do |currentGoal|
			currentGoal.journal_entries.each do |journal_entry|
				if journal_entry.duration.present? && currentGoal.trainingTimeInterval.present? 
          			if journal_entry.duration >= currentGoal.trainingTimeInterval 
            			trainingCount += 1
          			end
        		end
        	end

        	if currentGoal.goalNumber > 0
	        	percentageComplete = trainingCount.to_f / currentGoal.goalNumber.to_f
	        end

        	goalHashes.merge!(currentGoal.id => percentageComplete)
        end

        goalHashes.each do |key, value|
        	goal = Goal.find(key)
        	goal.percentComplete = value
        	goal.save!
        end
	end

	def is_goal_complete?

		trainingCount = 0

		goalHashes = {}

		self.goals.each do |currentGoal|
			currentGoal.journal_entries.each do |journal_entry|
				if journal_entry.duration.present? && currentGoal.trainingTimeInterval.present? 
          			if journal_entry.duration >= currentGoal.trainingTimeInterval 
            			trainingCount += 1
          			end
        		end
        	end

	    	if trainingCount >= currentGoal.goalNumber
	    		complete = true
	    	else 
	    		complete = false
	    	end

        	goalHashes.merge!(currentGoal.id => complete)
        end

        goalHashes.each do |key, value|
        	goal = Goal.find(key)
        	goal.complete = value
        	goal.save!
        end

	end 
	
end
