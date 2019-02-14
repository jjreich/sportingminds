class Comment < ApplicationRecord
    has_ancestry

	belongs_to :user
end
