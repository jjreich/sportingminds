class AddAncestryToGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :ancestry, :string
    add_index :goals, :ancestry
  end
end
