class Goal < ApplicationRecord

	belongs_to :user
	has_and_belongs_to_many :journal_entries

	before_save :adjust_completion_percentage

	private

	def adjust_completion_percentage

		trainingCount = 0

		self.journal_entries.each do |journal_entry|
			if journal_entry.duration.present? && self.trainingTimeInterval.present? 
      			if journal_entry.duration >= self.trainingTimeInterval 
        			trainingCount += 1
      			end
    		end
    	end

    	if self.goalNumber > 0
        	percentageComplete = trainingCount.to_f / self.goalNumber.to_f
        end
		
		self.percentComplete = percentageComplete
	end

end
