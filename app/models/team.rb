class Team < ApplicationRecord
	has_many :team_user_relationships
	has_many :users, :through => :team_user_relationships
	has_many :goals
	has_many :journal_entries

end
