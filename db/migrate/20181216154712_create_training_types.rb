class CreateTrainingTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :training_types do |t|

      t.timestamps
    end
  end
end
