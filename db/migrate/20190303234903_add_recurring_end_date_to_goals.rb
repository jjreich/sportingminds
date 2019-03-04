class AddRecurringEndDateToGoals < ActiveRecord::Migration[5.1]
  def change
  	add_column :goals, :recurringEndDate, :date
  end
end
