class Goal < ApplicationRecord

	belongs_to :user
	has_and_belongs_to_many :journal_entries

	before_save :adjust_completion_percentage, :is_complete?, :is_active?

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

	def is_complete?

		trainingCount = 0

		self.journal_entries.each do |journal_entry|
			if journal_entry.duration.present? && self.trainingTimeInterval.present? 
      			if journal_entry.duration >= self.trainingTimeInterval 
        			trainingCount += 1
      			end
    		end
    	end

    	if trainingCount >= self.goalNumber
    		self.complete = true
    	else 
    		self.complete = false
    	end

	end 

	def is_active?

		if (Date.today <= self.goalEndDate && Date.today >= self.goalStartDate)
			self.active = true
		else
			self.active = false
    	end

	end 

end
