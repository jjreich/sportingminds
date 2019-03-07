class User < ApplicationRecord
  rolify :before_add => :before_add_method

  after_create :assign_default_role

  has_many :journal_entries
  has_many :goals
  has_many :comments
  has_many :accountability_partnerships
  has_many :accountability_partners, :through => :accountability_partnerships
  has_many :inverse_accountability_partnerships, :class_name => "AccountabilityPartnership", :foreign_key => "accountability_partner_id"
  has_many :inverse_accountability_partners, :through => :inverse_accountability_partnerships, :source => :user
  has_many :team_user_relationships
  has_many :teams, :through => :team_user_relationships
  has_many :viewed_comments

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def fullName
    first_name + " " + last_name
  end

  def before_add_method(role)

  end

  def assign_default_role
  	self.add_role(:athlete) if self.roles.blank?
  end
end
