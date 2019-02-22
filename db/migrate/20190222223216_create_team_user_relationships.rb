class CreateTeamUserRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :team_user_relationships do |t|
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
  end
end
