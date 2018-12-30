class AddIconToSports < ActiveRecord::Migration[5.1]
  def change
  	add_column :sports, :icon, :string
  end
end
