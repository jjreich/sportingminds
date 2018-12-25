class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :sport
      t.string :goalType
      t.date :goalStartDate
      t.date :goalEndDate
      t.boolean :training
      t.boolean :recurring
      t.string :goalInterval
      t.integer :goalNumber
      t.string :trainingType
      t.string :description
      t.string :accountabilityPartners, array: true, default: []
      t.float :percentComplete
      t.boolean :active
      t.boolean :complete

      t.timestamps
    end
  end
end
