class Batch < ActiveRecord::Base
	has_many :channels 
	validates_presence_of :name
end
