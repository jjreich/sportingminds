class RenameAccountabilityPartnerships < ActiveRecord::Migration[5.1]
  def change
     rename_table :accountablity_partnerships, :accountability_partnerships
  end
end
