class RemoveAccountabilityPartnersFromGoals < ActiveRecord::Migration[5.1]
  def change
   	remove_column :goals, :accountabilityPartners
  end
end
