class AddNameToTrainingTypes < ActiveRecord::Migration[5.1]
  def change
  	add_column :training_types, :name, :string
  end
end
