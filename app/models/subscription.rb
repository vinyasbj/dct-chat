class Subscription < ActiveRecord::Base
	belongs_to :channel
	belongs_to :student
	belongs_to :user
	
	#validates_presence_of :channel_id , :student_id
end
