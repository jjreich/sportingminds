class ActiveTest
  	include Sidekiq::Worker
	def perform(goal_id)
		goal = Goal.find(goal_id)
		if (Date.today <= goal.goalEndDate && Date.today >= goal.goalStartDate)
			goal.active = true
		else
			goal.active = false
    	end
    	goal.save
	end
end