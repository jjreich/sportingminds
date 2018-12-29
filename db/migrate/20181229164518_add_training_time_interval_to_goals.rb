class AddTrainingTimeIntervalToGoals < ActiveRecord::Migration[5.1]
  def change
  	add_column :goals, :trainingTimeInterval, :integer
  end
end
