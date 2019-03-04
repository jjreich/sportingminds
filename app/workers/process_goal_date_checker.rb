class ProcessGoalDateChecker
  include Sidekiq::Worker

  def perform
    goals = Goal.where(:active => true, :goalType => "3")
    goals.each do |goal|
    	if goal.goalEndDate < Date.today
    		goal.active = false
    		if (goal.recurring == true && goal.recurringEndDate > Date.today)
    			new_goal = goal.dup
    			new_goal.goalStartDate = (new_goal.goalStartDate+7)
    			new_goal.goalEndDate = (new_goal.goalEndDate+7)
    			new_goal.active = true
    			new_goal.user_id = goal.user_id
    			new_goal.save
    		end	
    		goal.save
    	end
    end
  end
end