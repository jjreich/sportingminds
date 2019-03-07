class Comment < ApplicationRecord
    has_ancestry

	belongs_to :user
	has_many :viewed_comments
end
