# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  date_begin   :date
#  date_end     :date
#  description  :text(65535)
#  status       :boolean
#  user_id      :integer
#  namespace_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Project < ActiveRecord::Base
	# belongs_to :user
	has_and_belongs_to_many :users
end
