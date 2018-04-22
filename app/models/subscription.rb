class Subscription < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :channel
	belongs_to :student
	belongs_to :user
	
	def student_name
		Student.find(self.student_id).name
	end
end
