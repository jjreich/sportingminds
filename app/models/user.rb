class User < ApplicationRecord
  rolify :before_add => :before_add_method

  after_create :assign_default_role

  has_many :journal_entries
  has_many :goals

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def before_add_method(role)

  end

  def assign_default_role
  	self.add_role(:athlete) if self.roles.blank?
  end
end
