class Subscription < ActiveRecord::Base
	belongs_to :channel
	belongs_to :student 
end
