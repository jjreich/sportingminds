class AccountabilityPartnership < ApplicationRecord
	belongs_to :user
	belongs_to :accountability_partner, :class_name => "User"
end
