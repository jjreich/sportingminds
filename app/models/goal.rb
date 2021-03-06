class Goal < ApplicationRecord
	has_ancestry

	belongs_to :user, required: false
	belongs_to :team, required: false
	has_many :comments
	has_and_belongs_to_many :journal_entries

	before_save :adjust_completion_percentage, :adjust_goal_end_date, :is_active?, :is_complete?

	private

	def adjust_completion_percentage

		if (self.goalType == "3")

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
		else
			self.percentComplete = 0
		end
	end

	def adjust_goal_end_date

		if self.goalType == "3"
			if self.goalInterval == "Daily"
				self.goalEndDate = self.goalStartDate
			elsif self.goalInterval == "Weekly"
				self.goalEndDate = self.goalStartDate + 6.days
			elsif self.goalInterval == "Monthly"
				self.goalEndDate = self.goalStartDate + 1.month
			elsif self.goalInterval == "Annually"
				self.goalEndDate = self.goalStartDate + 1.year
			end
		end

	end

	def is_complete?

		if (self.goalType == "3")

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

	end 

	def is_active?

		if (Date.today <= self.goalEndDate && Date.today >= self.goalStartDate)
			self.active = true
		else
			self.active = false
    	end

	end 

end
