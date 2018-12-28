class Goal < ApplicationRecord

	belongs_to :user
	has_and_belongs_to_many :journal_entries

end
