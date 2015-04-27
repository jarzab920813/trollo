class Task < ActiveRecord::Base
	belongs_to :project
	has_and_belongs_to_many :users
	PRIORITIES = [:low, :normal, :high]
	enum priority: PRIORITIES
end
