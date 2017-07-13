class Student < ActiveRecord::Base
	has_many :subscriptions
	has_one :user
	# validates_presence_of :name ,:email ,:mobile
	# validates_numericality_of :mobile
	# validates_length_of :mobile , maximum: 10
end
