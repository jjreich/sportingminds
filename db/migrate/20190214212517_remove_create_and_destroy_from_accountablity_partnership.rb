class RemoveCreateAndDestroyFromAccountablityPartnership < ActiveRecord::Migration[5.1]
  def change
  	  	remove_column :accountability_partnerships, :create
  	  	remove_column :accountability_partnerships, :destroy
  end
end
